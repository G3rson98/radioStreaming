part of 'audio_bloc.dart';

abstract class AudioState extends Equatable {
  const AudioState();
}

class AudioNotPlaying extends AudioState {
  @override
  List<Object> get props => [];
}

class AudioPlaying extends AudioState {

  final int idPlaying;
  final Duration currentPosition;
  final Duration totalDuration;

  const AudioPlaying({required this.idPlaying,this.currentPosition = const Duration(),this.totalDuration = const Duration()});

  @override
  List<Object> get props => [idPlaying,currentPosition,totalDuration];
}

class AudioPaused extends AudioState {

  final int idPlaying;

  const AudioPaused({required this.idPlaying});

  @override
  List<Object> get props => [idPlaying];
}

