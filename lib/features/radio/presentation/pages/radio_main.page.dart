import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/textstyle.dart';
import '../../../history/presentation/bloc/history_bloc.dart';
import '../../../history/presentation/widgets/history_list_view.dart';
import '../../../home/presentation/bloc/ad/ad_bloc.dart';
import '../widgets/main_radio_widget.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(context.read())..add(GetRadioHistory()),
      child: Scaffold(
        backgroundColor: CustomColors.licorice,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const MainRadioWidget(),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Transmisiones pasadas',
                            style: Style.s20.w700?.apply(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                    ],
                  ),
                ),
                const HistoryListView(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                )
              ],
            ),
            BlocBuilder<AdBloc, AdState>(
              builder: (_, state) {
                if (state is AdLoaded) {
                  return SizedBox(
                      height: 50,
                      child: AdWidget(ad: state.bannerAd)
                  );
                }
                return const SizedBox();
              },
            )

          ],
        ),
      ),
    );
  }
}
