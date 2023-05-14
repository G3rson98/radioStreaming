part of 'announcement_detail_bloc.dart';

abstract class AnnouncementDetailState extends Equatable {
  const AnnouncementDetailState();
}

class AnnouncementDetailInitial extends AnnouncementDetailState {
  @override
  List<Object> get props => [];
}

class AnnouncementDetailLoaded extends AnnouncementDetailState {
  final Announcement announcement;

  const AnnouncementDetailLoaded({required this.announcement});
  @override
  List<Object> get props => [announcement];
}

class AnnouncementDetailError extends AnnouncementDetailState {
  @override
  List<Object> get props => [];
}