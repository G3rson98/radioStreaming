part of 'audio_bloc.dart';

abstract class AudioState extends Equatable {
  const AudioState();
}

class AudioNotPlaying extends AudioState {
  @override
  List<Object> get props => [];
}

class AudioPlayingOrPaused extends AudioState {

  final int idPlaying;
  final Duration currentPosition;
  final Duration totalDuration;
  final bool isPaused;

  const AudioPlayingOrPaused({required this.idPlaying,this.currentPosition = const Duration(),this.totalDuration = const Duration(),this.isPaused = false});

  @override
  List<Object> get props => [idPlaying,currentPosition,totalDuration,isPaused];
}

