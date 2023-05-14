part of 'social_network_bloc.dart';

abstract class SocialNetworkEvent extends Equatable {
  const SocialNetworkEvent();
}

class InitSocialNetworks extends SocialNetworkEvent{
  @override
  List<Object?> get props =>[];

}