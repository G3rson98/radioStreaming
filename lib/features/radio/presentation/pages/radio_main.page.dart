import 'package:flutter/material.dart';
import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/textstyle.dart';
import '../../../../icon_sax_icons.dart';
import '../widgets/banner_chapter.widget.dart';
import '../widgets/chapter_item_list.widget.dart';

// Icon(IconSax.play_circle,color: Colors.orange)

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.licorice,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BannerChapter(),
              Text(
                'Radio 96.9 FM',
                style: Style.s22.w700?.apply(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Fader 3600, Merlo norte',
                style: Style.s14.w300?.apply(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 18),
              const Icon(
                IconSax.play_circle,
                color: Colors.orange,
                size: 54,
              ),
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
              ...List.generate(
                10,
                (index) => const Padding(
                  padding: EdgeInsets.only(bottom: 22, left: 32, right: 32),
                  child: ChapterItem(
                    title: 'chapter1',
                    subTitle: 'Hablando de todo un poco',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
