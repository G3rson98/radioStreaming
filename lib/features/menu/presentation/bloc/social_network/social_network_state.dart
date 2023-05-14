part of 'social_network_bloc.dart';

abstract class SocialNetworkState extends Equatable {
  const SocialNetworkState();
}

class SocialNetworkInitial extends SocialNetworkState {
  @override
  List<Object> get props => [];
}

class SocialNetworkLoading extends SocialNetworkState {
  @override
  List<Object> get props => [];
}

class SocialNetworkLoaded extends SocialNetworkState {

  final List<SocialNetwork> socialNetworks;

  const SocialNetworkLoaded({this.socialNetworks = const []});

  @override
  List<Object> get props => [socialNetworks];
}

class SocialNetworkError extends SocialNetworkState {

  final String message;

  const SocialNetworkError({required this.message});



  @override
  List<Object> get props => [message];
}