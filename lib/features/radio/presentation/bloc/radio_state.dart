part of 'radio_bloc.dart';

enum RadioPlayerState {
  playing,
  stopped,
  paused
}

abstract class RadioState extends Equatable {
  const RadioState();
}

class RadioInitial extends RadioState {
  @override
  List<Object> get props => [];
}

class RadioLoading extends RadioState {
  @override
  List<Object> get props => [];
}

class RadioPlaying extends RadioState {
  @override
  List<Object> get props => [];
}

class RadioLoaded extends RadioState {

  final AudioItem radio;
  final String imageUrl;
  final RadioPlayerState radioPlayerState;

  const RadioLoaded({required this.radio,required this.imageUrl,this.radioPlayerState = RadioPlayerState.stopped});

  @override
  List<Object> get props => [radio,imageUrl,radioPlayerState];
}


class RadioError extends RadioState {
  @override
  List<Object> get props => [];
}