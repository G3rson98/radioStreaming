
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

part 'web_view_event.dart';
part 'web_view_state.dart';

class WebViewBloc extends Bloc<WebViewEvent, WebViewState> {
  WebViewBloc() : super(WebViewInitial()) {

    on<LoadWebView>((event, emit) {
      emit(WebViewLoading());
      emit(const WebViewCreated(url: 'https://sites.google.com/view/canaanproducciones/pel%C3%ADculas?authuser=0',));

    });

    on<ChangeProgress>((event, emit) {
      final currentState = state;
      if(currentState is WebViewReady){
        emit(currentState.copyWith(isLoading: event.progress<100,progress: event.progress/100)
        );
      }

    });


    on<ChangeTitle>((event, emit) async {
      final currentState = state;
      if(currentState is WebViewReady){
        if(event.title!=null){
          final canGoBack = await currentState.webController.canGoBack();
          emit(currentState.copyWith(isLoading: currentState.progress<100,canGoBack: canGoBack,pageName: event.title));

        }

      }

    });

    on<GoBack>((event, emit) async {
      final currentState = state;
      if(currentState is WebViewReady){
        final canGoBack = await currentState.webController.canGoBack();
        if(canGoBack){
          await currentState.webController.goBack();
          emit(
              currentState.copyWith(
                  progress: 0,
                  isLoading: true
              )
          );
        }
      }

    });

    on<CreateWebViewController>((event, emit) {
      emit(
          WebViewReady(url: state.url,isLoading: true,webController: event.controller,progress: state.progress,pageName: state.pageName)
      );
    });

  }
}
