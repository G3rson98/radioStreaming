part of 'history_bloc.dart';

abstract class HistoryState extends Equatable{}

class HistoryInitial extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoading extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoaded extends HistoryState {

  final List<AudioItem> pastEpisodes;

  HistoryLoaded({required this.pastEpisodes});

  @override
  List<Object?> get props => [pastEpisodes];
}

class HistoryError extends HistoryState {
  final String message;

  HistoryError({required this.message});
  @override
  List<Object?> get props => [message];
}
