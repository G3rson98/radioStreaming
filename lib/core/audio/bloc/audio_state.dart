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

  const AudioPlaying({required this.idPlaying});

  @override
  List<Object> get props => [idPlaying];
}

class AudioPaused extends AudioState {

  final int idPlaying;

  const AudioPaused({required this.idPlaying});

  @override
  List<Object> get props => [idPlaying];
}

