import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/bloc/audio_bloc.dart';
import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/icon_sax_icons.dart';
import '../../../../core/presentation/theme/textstyle.dart';
import '../../domain/entities/history_item.dart';

class ChapterItem extends StatelessWidget {
  final HistoryItem item;

  const ChapterItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<AudioBloc>().add(PlayPause(audioFile: '163615c8-8b28-44b6-9ae4-cee13ed60453',id: item.id)),
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 60,
                child: Stack(
                  children: [
                    Image.network(item.image,
                        fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black12,
                    ),
                    BlocBuilder<AudioBloc,AudioState>(
                      builder: (_,state){
                        print(state);
                        if(state is AudioPlaying){
                          if(state.idPlaying == item.id){
                            return const Center(
                              child: Icon(
                                IconSax.play_circle,
                                color: Colors.white70,
                                size: 32
                              ),
                            );
                          }
                        }

                        if(state is AudioPaused){
                          if(state.idPlaying == item.id){
                            return const Center(
                              child: Icon(
                                  IconSax.pause_circle,
                                  color: Colors.white70,
                                  size: 32
                              ),
                            );
                          }
                        }


                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 19,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Style.s14.w500?.apply(
                    color: CustomColors.cornFlower,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  item.subTitle,
                  style: Style.s12.w300?.apply(
                    color: CustomColors.cornFlower.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              IconSax.document_download,
              color: Colors.orange,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
