
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/error_messages.dart';
import '../../domain/entities/announcement.dart';
import '../../domain/use_cases/get_announcements_use_case.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  
  final GetAnnouncements _getAnnouncements;
  
  AnnouncementBloc(this._getAnnouncements) : super(AnnouncementInitial()) {
    on<GetAllAnnouncements>((event, emit) async {
      emit(AnnouncementLoading());
      final failureOrEpisodes =  await _getAnnouncements();
      emit(failureOrEpisodes.fold(
              (failure) => AnnouncementError(message: ErrorMessages.mapFailureToMessage(failure)),
              (announcements)  => announcements.isNotEmpty ? AnnouncementLoaded(announcements: announcements) : AnnouncementEmpty()
      ));
    });
  }
}
