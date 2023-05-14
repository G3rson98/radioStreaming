
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/theme/textstyle.dart';
import '../../../home/presentation/bloc/ad/ad_bloc.dart';
import '../../../home/presentation/widgets/banner_ad.dart';
import '../widgets/history_list_view.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdBloc()..add(InitAds()),
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 33,top: 50,bottom: 10),
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
                ),
                const HistoryListView(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                )
              ],
            ),
            const BannerAdWidget()
          ],
        ),
      ),
    );
  }
}