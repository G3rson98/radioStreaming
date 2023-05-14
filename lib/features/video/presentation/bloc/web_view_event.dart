part of 'web_view_bloc.dart';

abstract class WebViewEvent extends Equatable {
  const WebViewEvent();
}
class LoadWebView extends WebViewEvent {

  @override
  List<Object?> get props => [];

}


class ChangeProgress extends WebViewEvent {

  final int progress;

  const ChangeProgress({required this.progress});

  @override
  List<Object?> get props => [progress];

}

class ChangeTitle extends WebViewEvent {

  final String? title;

  const ChangeTitle({required this.title});

  @override
  List<Object?> get props => [title];

}

class GoBack extends WebViewEvent {

  @override
  List<Object?> get props => [];

}

class GoForward extends WebViewEvent {

  @override
  List<Object?> get props => [];

}

class CreateWebViewController extends WebViewEvent {

  final InAppWebViewController controller;

  const CreateWebViewController({required this.controller});

  @override
  List<Object?> get props => [controller];

}
