part of 'url_bloc.dart';

abstract class UrlState extends Equatable {
  const UrlState();
}

class UrlInitial extends UrlState {
  @override
  List<Object> get props => [];
}

class UrlSuccess extends UrlState {
  @override
  List<Object> get props => [];
}

class UrlError extends UrlState {

  final String message;

  const UrlError({required this.message});

  @override
  List<Object> get props => [message];
}