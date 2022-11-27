import 'package:flutter/material.dart';
import 'package:radiostreaming/icon_sax_icons.dart';
import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/textstyle.dart';

class ChapterItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const ChapterItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            width: 19,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Style.s14.w500?.apply(
                  color: CustomColors.cornFlower,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                subTitle,
                style: Style.s12.w300?.apply(
                  color: CustomColors.cornFlower.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.download,
            color: Colors.orange,
            size: 24,
          ),
        ],
      ),
    );
  }
}
