import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/bloc/audio_bloc.dart';

class AudioProgressBar extends StatelessWidget {

  final int currentIdPlaying;
  const AudioProgressBar({Key? key, required this.currentIdPlaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        if(state is AudioPlayingOrPaused){
          if(state.idPlaying == currentIdPlaying){

            return Column(
              children: [
                SizedBox(
                  height: 20,
                  child: Slider(
                    value: state.currentPosition.inSeconds.toDouble(),
                    onChanged: (value) => context.read<AudioBloc>().add(Seek(currentPosition: Duration(seconds: value.floor()))),
                    min: 0.0,
                    max: state.totalDuration.inSeconds.toDouble(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.currentPosition.toString().substring(0,7),style: const TextStyle(color: Colors.white),),
                    Text(state.totalDuration.toString().substring(0,7),style: const TextStyle(color: Colors.white),)
                  ],
                ),


              ],
            );
          }

        }

        return const SizedBox();

      },
    );
  }
}
