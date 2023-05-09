import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../bloc/ad/ad_bloc.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdBloc, AdState>(
      builder: (_, state) {
        if (state is AdLoaded) {
          return SizedBox(
              height: 50,
              child: AdWidget(ad: state.bannerAd)
          );
        }
        return const SizedBox();
      },
    );
  }
}
