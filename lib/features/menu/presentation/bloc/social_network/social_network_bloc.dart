import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/error_messages.dart';
import '../../../domain/entities/social_network.dart';
import '../../../domain/use_cases/get_social_networks_use_case.dart';

part 'social_network_event.dart';
part 'social_network_state.dart';

class SocialNetworkBloc extends Bloc<SocialNetworkEvent, SocialNetworkState> {
  final GetSocialNetworks _getSocialNetworks;

  SocialNetworkBloc(this._getSocialNetworks) : super(SocialNetworkInitial()) {

    on<InitSocialNetworks>((event, emit) async {
      emit(SocialNetworkLoading());
      final failureOrSocial =  await _getSocialNetworks();
      emit(failureOrSocial.fold(
              (failure) => SocialNetworkError(message: ErrorMessages.mapFailureToMessage(failure)),
              (socialNetworks)  => SocialNetworkLoaded(socialNetworks: socialNetworks)
      ));
    });
  }
}
