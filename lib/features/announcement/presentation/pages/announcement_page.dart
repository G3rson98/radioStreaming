import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/banner_ad.dart';

import '../widgets/announcement_list.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
