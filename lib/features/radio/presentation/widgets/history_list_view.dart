import 'package:flutter/material.dart';

import '../../domain/entities/history_item.dart';
import 'chapter_item_list.widget.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverList(
        delegate: SliverChildBuilderDelegate(
                (_,index) => Padding(
              padding:
              const EdgeInsets.only(bottom: 22, left: 32, right: 32),
              child: ChapterItem(
                item: HistoryItem(
                    id: index,
                    title: 'Episodio ${index}',
                    subTitle: 'Hablamos de todo',
                    file: '163615c8-8b28-44b6-9ae4-cee13ed60453',
                    image:
                    'https://wyfv6blw.directus.app/assets/949e269b-19a4-4cc8-ab5f-6e9ff06e80ef?width=60&height=60'),
              ),
            ),
            childCount: 10
        )
    );
  }
}
