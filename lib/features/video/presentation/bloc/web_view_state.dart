part of 'web_view_bloc.dart';

abstract class WebViewState extends Equatable {
  final String pageName;
  final String url;
  final bool isLoading;
  final double progress;

  const WebViewState({
    this.pageName = '',
    this.url = '',
    this.isLoading = false,
    this.progress = 0.0
  });
}

class WebViewInitial extends WebViewState {
  @override
  List<Object> get props => [];
}

class WebViewLoading extends WebViewState {
  @override
  List<Object> get props => [];
}


class WebViewCreated extends WebViewState {


  const WebViewCreated({
    super.pageName = '',
    required super.url,
    super.isLoading = true,
    super.progress = 0,
  });

  @override
  List<Object> get props => [pageName,url,isLoading,progress];
}

class WebViewReady extends WebViewState {

  final InAppWebViewController webController;
  final bool canGoBack,canGoForward;

  const WebViewReady({
    required super.pageName,
    required super.url,
    required super.isLoading,
    required super.progress,
    required this.webController,
    this.canGoBack = false,
    this.canGoForward = false
  });

  copyWith({
    String? pageName,
    String? url,
    bool? isLoading,
    bool? canGoBack,
    bool? canGoForward,
    double? progress,
    InAppWebViewController? webController
}) => WebViewReady(
      pageName: pageName ?? this.pageName,
      url: url ?? this.url,
      isLoading: isLoading ?? this.isLoading,
      canGoBack: canGoBack ?? this.canGoBack,
      canGoForward: canGoForward ?? this.canGoForward,
      progress: progress ?? this.progress,
      webController: webController ?? this.webController
  );

  @override
  List<Object> get props => [pageName,url,isLoading,progress,webController,canGoBack,canGoForward];
}

class WebViewError extends WebViewState {
  @override
  List<Object> get props => [];
}