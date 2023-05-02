import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/textstyle.dart';
import '../widgets/history_list_view.dart';
import '../widgets/main_radio_widget.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.licorice,
      body: CustomScrollView(
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
          const HistoryListView()
        ],
      ),
    );
  }
}
