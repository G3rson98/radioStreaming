part of 'ad_bloc.dart';

abstract class AdState extends Equatable {
  const AdState();
}

class AdInitial extends AdState {
  @override
  List<Object> get props => [];
}


class AdLoaded extends AdState {
  final BannerAd bannerAd;

  const AdLoaded({required this.bannerAd});
  @override
  List<Object> get props => [];
}