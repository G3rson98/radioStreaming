import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/audio/bloc/audio_bloc.dart';
import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/theme/icon_sax_icons.dart';
import '../../../../core/presentation/theme/textstyle.dart';
import '../bloc/radio_bloc.dart';

class MainRadioWidget extends StatelessWidget {
  const MainRadioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RadioBloc, RadioState>(
      listener: (_,state) {
        if (state is RadioPlaying){
          context.read<AudioBloc>().add(Stop());
        }
      },
      builder: (context, state) {
        if(state is RadioLoaded){
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                margin: const EdgeInsets.symmetric(
                  horizontal: 47,
                  vertical: 17,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.prussianBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(state.imageUrl),
              ),
              Text(
                state.radio.title,
                style: Style.s22.w700?.apply(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                state.radio.subTitle,
                style: Style.s14.w300?.apply(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
               onTap: () => context.read<RadioBloc>().add(PlayStop()),
               child: state.radioPlayerState==RadioPlayerState.stopped
                   ? const Icon(
                 IconSax.play_circle,
                 color: Colors.orange,
                 size: 54,
               )
                   : const Icon(
                 IconSax.stop_circle,
                 color: Colors.orange,
                 size: 54,
               ),
              )

            ],
          );
        }
        //TODO: Cambiar los widgets para error y carga
        return const SizedBox();
      },
    );
  }
}
