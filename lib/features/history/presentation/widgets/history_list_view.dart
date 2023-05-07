import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/history_bloc.dart';
import 'chapter_item_list_widget.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if(state is HistoryLoaded){
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                      (_, index) =>
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 32, right: 32),
                        child: ChapterItem(
                          item: state.pastEpisodes[index],
                        ),
                      ),
                  childCount: state.pastEpisodes.length
              )
          );
        }

        return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator.adaptive()));

      },
    );
  }
}
