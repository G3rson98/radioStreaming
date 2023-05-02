import 'package:flutter/material.dart';

import '../../domain/entities/audio_item.dart';
import 'chapter_item_list_widget.dart';

class HistoryListView extends StatelessWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
                (_,index) => Padding(
              padding:
              const EdgeInsets.only(bottom: 22, left: 32, right: 32),
              child: ChapterItem(
                item: AudioItem(
                    id: index+1,
                    title: 'Episodio ${index+1}',
                    subTitle: 'Hablamos de todo',
                    file: 'e968d3b1-2a5f-4908-b324-632474f35631',
                    image: 'https://directus.elroir.cloud/assets/f1b024bf-3d31-4ea3-8736-e2c72bd8a3ac?width=80&height=80'),
              ),
            ),
            childCount: 10
        )
    );
  }
}
