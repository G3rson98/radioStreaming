
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ad_event.dart';
part 'ad_state.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  AdBloc() : super(AdInitial()) {
    on<InitAds>((event, emit) {

      final BannerAd myBanner = BannerAd(
        adUnitId: 'ca-app-pub-5693811893978918/6522174498',
        size: AdSize.banner,
        request: const AdRequest(),
        listener: const BannerAdListener()
      );
      myBanner.load();
      emit(AdLoaded(bannerAd: myBanner));
    });
  }
}
