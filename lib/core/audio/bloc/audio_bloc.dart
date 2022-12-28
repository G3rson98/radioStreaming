
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/audio_repository.dart';
import '../../../features/radio/domain/entities/history_item.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioRepository _audio;

  late StreamSubscription<Duration> _durationSubscription;
  AudioBloc(this._audio) : super(AudioNotPlaying()) {

    on<PlayPause>((event, emit) async {
      final currentState = state;

      if(currentState is AudioPaused){
        if(currentState.idPlaying==event.item.id){
          _durationSubscription.resume();
          _audio.resume();
          emit(AudioPlaying(idPlaying: event.item.id,totalDuration: _audio.audioDuration ?? const Duration()));
          return ;
        }
      }

      //TODO: Ajustar luego
      final urlToPlay = 'https://wyfv6blw.directus.app/assets/${event.item.file}';

      if(currentState is AudioPlaying){

        _durationSubscription.pause();
        if(currentState.idPlaying==event.item.id){
          _audio.pause();
          emit(AudioPaused(idPlaying: currentState.idPlaying));
          return ;

        }
      }


      _audio.playFromUrl(event.item.id,urlToPlay,event.item.title,event.item.image);

      _durationSubscription = _audio.positionStream.listen((event) {
        add(Playing(currentPosition: event));
      });


      emit(AudioPlaying(idPlaying: event.item.id,totalDuration: _audio.audioDuration ?? const Duration()));


    });

    on<Playing>((event, emit) {
      final currentState = state;

      if(currentState is AudioPlaying){
        emit(AudioPlaying(idPlaying: currentState.idPlaying,currentPosition: event.currentPosition,totalDuration: _audio.audioDuration ?? const Duration()));
      }

    });


    on<Seek>((event, emit) {
      final currentState = state;

      if(currentState is AudioPlaying){
        _audio.seekAudioPosition(event.currentPosition);
        emit(AudioPlaying(idPlaying: currentState.idPlaying,currentPosition: event.currentPosition,totalDuration: _audio.audioDuration ?? const Duration()));
      }

    });

    on<Stop>((event, emit) {

      _audio.stop();
      emit(AudioNotPlaying());
    });
  }
}
