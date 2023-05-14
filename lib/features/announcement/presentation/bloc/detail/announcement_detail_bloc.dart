
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/announcement.dart';

part 'announcement_detail_event.dart';
part 'announcement_detail_state.dart';

class AnnouncementDetailBloc extends Bloc<AnnouncementDetailEvent, AnnouncementDetailState> {
  AnnouncementDetailBloc() : super(AnnouncementDetailInitial()) {
    on<InitDetail>((event, emit) {
      if(event.announcement!=null){
        emit(AnnouncementDetailLoaded(announcement: event.announcement! as Announcement));
      }else{
        emit(AnnouncementDetailError());
      }
    });
  }
}
