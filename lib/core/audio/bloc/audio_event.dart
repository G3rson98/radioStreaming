part of 'audio_bloc.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();
}

class PlayPause extends AudioEvent {

  final AudioItem item;

  const PlayPause({required this.item});

  @override
  List<Object?> get props => [item];

}

class Playing extends AudioEvent {

  final Duration currentPosition;

  const Playing({required this.currentPosition});

  @override
  List<Object?> get props => [currentPosition];

}


class Seek extends AudioEvent {

  final Duration currentPosition;

  const Seek({required this.currentPosition});

  @override
  List<Object?> get props => [currentPosition];

}

class Stop extends AudioEvent {


  @override
  List<Object?> get props => [];

}