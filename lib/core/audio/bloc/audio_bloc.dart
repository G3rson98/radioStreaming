
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/audio_repository.dart';
import '../../../features/radio/domain/entities/history_item.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioRepository _audio;
  AudioBloc(this._audio) : super(AudioNotPlaying()) {
    on<PlayPause>((event, emit) {
      final currentState = state;


      if(currentState is AudioPaused){
        if(currentState.idPlaying==event.item.id){
          _audio.resume();
          emit(AudioPlaying(idPlaying: event.item.id));
          return ;
        }
      }

      //TODO: Ajustar luego
      final urlToPlay = 'https://wyfv6blw.directus.app/assets/${event.item.file}';

      if(currentState is AudioPlaying){

        if(currentState.idPlaying==event.item.id){
          _audio.pause();
          emit(AudioPaused(idPlaying: currentState.idPlaying));
          return ;

        }
      }


      _audio.playFromUrl(event.item.id,urlToPlay,event.item.title,event.item.image);
      emit(AudioPlaying(idPlaying: event.item.id));


    });

    on<Stop>((event, emit) {

      _audio.stop();
      emit(AudioNotPlaying());
    });
  }
}
