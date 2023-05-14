import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/error_messages.dart';
import '../../../radio/domain/entities/audio_item.dart';
import '../../domain/use_cases/get_past_episodes_use_case.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetPastEpisodes _getPastEpisodes;

  HistoryBloc(this._getPastEpisodes) : super(HistoryInitial()) {

    on<GetRadioHistory>((event, emit) async {
      emit(HistoryLoading());
      final failureOrEpisodes =  await _getPastEpisodes();
      emit(failureOrEpisodes.fold(
              (failure) => HistoryError(message: ErrorMessages.mapFailureToMessage(failure)),
              (episodes)  => HistoryLoaded(pastEpisodes: episodes)
      ));
    });

  }
}
