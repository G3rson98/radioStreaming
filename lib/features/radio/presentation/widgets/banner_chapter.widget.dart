import 'package:flutter/material.dart';
import '../../../../core/presentation/theme/assets.dart';
import '../../../../core/presentation/theme/colors.dart';

class BannerChapter extends StatelessWidget {
  const BannerChapter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: const EdgeInsets.symmetric(
        horizontal: 47,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: CustomColors.prussianBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(CustomAssets.bannerChapter),
    );
  }
}
