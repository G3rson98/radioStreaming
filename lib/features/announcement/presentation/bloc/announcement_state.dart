part of 'announcement_bloc.dart';

abstract class AnnouncementState extends Equatable {
  const AnnouncementState();
}

class AnnouncementInitial extends AnnouncementState {
  @override
  List<Object> get props => [];
}


class AnnouncementLoading extends AnnouncementState {
  @override
  List<Object> get props => [];
}


class AnnouncementLoaded extends AnnouncementState {
  final List<Announcement> announcements;

  const AnnouncementLoaded({required this.announcements});

  @override
  List<Object> get props => [announcements];
}

class AnnouncementEmpty extends AnnouncementState {

  @override
  List<Object> get props => [];
}

class AnnouncementError extends AnnouncementState {

  final String message;

  const AnnouncementError({required this.message});

  @override
  List<Object> get props => [message];
}
