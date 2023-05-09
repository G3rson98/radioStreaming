
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/audio_repository.dart';
import '../../../features/radio/domain/entities/audio_item.dart';
import '../../http/http_options.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioRepository _audio;

  late StreamSubscription<Duration> _durationSubscription;
  AudioBloc(this._audio) : super(AudioNotPlaying()) {

    on<PlayPause>((event, emit) async {
      final currentState = state;

      final urlToPlay = '${HttpOptions.apiUrl}/assets/${event.item.file}';

      if(currentState is AudioPlayingOrPaused){

          if(currentState.idPlaying==event.item.id){

            if(currentState.isPaused) {
              _durationSubscription.resume();
              _audio.resume();
              emit(AudioPlayingOrPaused(idPlaying: event.item.id,totalDuration: _audio.audioDuration ?? const Duration(),isPaused: false));
              return ;
            }

            _durationSubscription.pause();

            final currentPosition = await _audio.pause();

            emit(AudioPlayingOrPaused(idPlaying: currentState.idPlaying,currentPosition: currentPosition,totalDuration: _audio.audioDuration ?? const Duration(),isPaused: true));
            return ;

          }
      }


      _audio.playFromUrl(event.item.id,urlToPlay,event.item.title,event.item.getImage());

      _durationSubscription = _audio.positionStream.listen((event) {
        add(Playing(currentPosition: event));
      });


      emit(AudioPlayingOrPaused(idPlaying: event.item.id,totalDuration: _audio.audioDuration ?? const Duration()));


    });

    on<Playing>((event, emit) {
      final currentState = state;

      if(currentState is AudioPlayingOrPaused){
        emit(AudioPlayingOrPaused(idPlaying: currentState.idPlaying,currentPosition: event.currentPosition,totalDuration: _audio.audioDuration ?? const Duration(),isPaused: currentState.isPaused));
      }

    });


    on<Seek>((event, emit) {
      final currentState = state;

      if(currentState is AudioPlayingOrPaused){
        _audio.seekAudioPosition(event.currentPosition);
        final totalDuration = _audio.audioDuration ?? const Duration();
        if(event.currentPosition.inSeconds>=totalDuration.inSeconds){
          emit(AudioNotPlaying());
          return ;
        }
        emit(AudioPlayingOrPaused(idPlaying: currentState.idPlaying,currentPosition: event.currentPosition,totalDuration: totalDuration,isPaused: currentState.isPaused));
      }

    });

    on<Stop>((event, emit) {

      //_audio.stop();
      emit(AudioNotPlaying());
    });
  }
}
