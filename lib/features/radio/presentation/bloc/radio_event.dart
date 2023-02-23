part of 'radio_bloc.dart';

abstract class RadioEvent extends Equatable {
  const RadioEvent();
}

class InitRadio extends RadioEvent{
  @override
  List<Object?> get props => [];
}

class PlayStop extends RadioEvent{
  @override
  List<Object?> get props => [];
}

class StopRadio extends RadioEvent{
  @override
  List<Object?> get props => [];
}
