part of 'announcement_bloc.dart';

abstract class AnnouncementEvent extends Equatable {
  const AnnouncementEvent();
}

class GetAllAnnouncements extends AnnouncementEvent{

  @override
  List<Object?> get props => [];

}
