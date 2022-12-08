part of 'audio_bloc.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();
}

class PlayPause extends AudioEvent {

  final String audioFile;
  final int id;

  const PlayPause({required this.audioFile,required this.id});

  @override
  List<Object?> get props => [audioFile,id];

}


class Stop extends AudioEvent {


  @override
  List<Object?> get props => [];

}