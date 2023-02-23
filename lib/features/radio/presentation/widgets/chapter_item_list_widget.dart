import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/bloc/audio_bloc.dart';
import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/icon_sax_icons.dart';
import '../../../../core/presentation/theme/textstyle.dart';
import '../../domain/entities/audio_item.dart';
import '../bloc/radio_bloc.dart';
import 'audio_progress_bar.dart';

class ChapterItem extends StatelessWidget {
  final AudioItem item;

  const ChapterItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<AudioBloc>().add(PlayPause(item: item)),
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 75,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  children: [
                    Image.network(item.image,
                        fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black12,
                    ),
                    BlocConsumer<AudioBloc,AudioState>(
                      listener: (context,state){
                        if(state is AudioPlayingOrPaused){
                          context.read<RadioBloc>().add(StopRadio());

                        }
                      },
                      builder: (_,state){
                        if(state is AudioPlayingOrPaused){
                          if(state.idPlaying == item.id){
                            if(state.isPaused){
                              return const Center(
                                child: Icon(
                                    IconSax.play_circle,
                                    color: Colors.white70,
                                    size: 32
                                ),
                              );
                            }
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
              width: 15,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Style.s14.w500?.apply(
                      color: CustomColors.cornFlower,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.subTitle,
                    maxLines: 2,
                    style: Style.s12.w300?.apply(
                      color: CustomColors.cornFlower.withOpacity(0.7),
                    ),
                  ),
                  const Spacer(),
                  AudioProgressBar(currentIdPlaying: item.id)
                ],
              ),
            ),
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
