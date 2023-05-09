import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/bloc/ad/ad_bloc.dart';
import '../../../home/presentation/widgets/banner_ad.dart';

import '../widgets/announcement_list.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdBloc()..add(InitAds()),
      child: Scaffold(
        body: Stack(
          children: const [
            CustomScrollView(
              slivers: [
                AnnouncementList()
              ],
            ),
            BannerAdWidget()
          ],
        ),
      ),
    );
  }
}
