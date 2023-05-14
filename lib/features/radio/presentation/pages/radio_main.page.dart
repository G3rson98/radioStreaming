import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/bloc/ad/ad_bloc.dart';
import '../../../home/presentation/widgets/banner_ad.dart';
import '../widgets/main_radio_widget.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdBloc()..add(InitAds()),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: const [
                  MainRadioWidget(),
                  SizedBox(height: 80),
                ],
              ),
            ),
            const BannerAdWidget()
          ],
        ),
      ),
    );
  }
}
