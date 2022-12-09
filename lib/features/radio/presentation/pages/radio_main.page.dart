import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/bloc/audio_bloc.dart';
import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/textstyle.dart';
import '../../../../core/presentation/theme/icon_sax_icons.dart';
import '../widgets/banner_chapter.widget.dart';
import '../widgets/history_list_view.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioBloc(context.read()),
      child: Scaffold(
        backgroundColor: CustomColors.licorice,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
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
                  ],
                ),
              ),
              const HistoryListView()
            ],
          ),
        ),
      ),
    );
  }
}
