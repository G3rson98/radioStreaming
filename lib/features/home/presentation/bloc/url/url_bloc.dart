
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/error_messages.dart';
import '../../../domain/use_cases/check_url_use_case.dart';
import '../../../domain/use_cases/open_url_use_case.dart';

part 'url_event.dart';
part 'url_state.dart';

class UrlBloc extends Bloc<UrlEvent, UrlState> {

  final CheckUrl _checkUrl;
  final OpenUrl _openUrl;

  UrlBloc(this._checkUrl, this._openUrl) : super(UrlInitial()) {

    on<LaunchUrl>((event, emit) async {
      final canOpen = await _checkUrl(event.link);
      if(!canOpen){
        emit(const UrlError(message: ErrorMessages.cantLaunchUrlMessage));
        return ;
      }
      await _openUrl(event.link);

      emit(UrlSuccess());

    });
  }
}
