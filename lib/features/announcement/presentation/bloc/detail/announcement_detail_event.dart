part of 'announcement_detail_bloc.dart';

abstract class AnnouncementDetailEvent extends Equatable {
  const AnnouncementDetailEvent();
}

class InitDetail extends AnnouncementDetailEvent{
  final Object? announcement;

  const InitDetail({required this.announcement});

  @override
  List<Object?> get props => [announcement];

}
