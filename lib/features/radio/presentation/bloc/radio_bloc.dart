import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/audio_repository.dart';
import '../../domain/entities/audio_item.dart';
import '../../domain/repositories/radio_repository.dart';

part 'radio_event.dart';
part 'radio_state.dart';

class RadioBloc extends Bloc<RadioEvent, RadioState> {

  final AudioRepository _audio;
  final RadioRepository _radio;

  RadioBloc(this._audio, this._radio) : super(RadioInitial()) {

    on<InitRadio>((event, emit) async {

      final radio = await _radio.getRadio();
      if(radio.ok){
        emit(RadioLoaded(radio: radio.data!,imageUrl: radio.data!.getImage()));
      }else{
        emit(RadioError());
      }


    });

    on<PlayStop>((event, emit) async {

      final currentState = state;
      if(currentState is RadioLoaded){
        final radio = currentState.radio;
        if(currentState.radioPlayerState==RadioPlayerState.stopped){
          emit(RadioPlaying());
          _audio.playFromUrl(radio.id,radio.file,radio.title,currentState.imageUrl);
          emit(RadioLoaded(radio: radio,imageUrl: currentState.imageUrl,radioPlayerState: RadioPlayerState.playing));
          return ;
        }

        _audio.stop();
        emit(RadioLoaded(radio: radio,imageUrl: currentState.imageUrl,radioPlayerState: RadioPlayerState.stopped));
        }


    });

    on<StopRadio>((event, emit) async {

      final currentState = state;
      if(currentState is RadioLoaded){
        final radio = currentState.radio;
        emit(RadioLoaded(radio: radio,imageUrl: currentState.imageUrl,radioPlayerState: RadioPlayerState.stopped));
      }

    });
  }
}
