part of 'url_bloc.dart';

abstract class UrlEvent extends Equatable {
  const UrlEvent();
}

class LaunchUrl extends UrlEvent{
  final String link;

  const LaunchUrl({required this.link});

  @override
  List<Object?> get props => [link];

}
