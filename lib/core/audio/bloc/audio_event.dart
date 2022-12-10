part of 'audio_bloc.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();
}

class PlayPause extends AudioEvent {

  final HistoryItem item;

  const PlayPause({required this.item});

  @override
  List<Object?> get props => [item];

}


class Stop extends AudioEvent {


  @override
  List<Object?> get props => [];

}