import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/theme/icon_sax_icons.dart';
import '../bloc/navigation_bar_cubit.dart';

class MenuBottomBar extends StatelessWidget {
  const MenuBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: BlocBuilder<NavigationBarCubit, int>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: NavigationBar(
              selectedIndex: state,
              height: 60,
              onDestinationSelected: context.read<NavigationBarCubit>().onChangeTab,
              destinations: const [
                NavigationDestination(
                    icon: Icon(IconSax.radio),
                    label: 'radio'
                ),
                NavigationDestination(
                    icon: Icon(IconSax.music_library_2),
                    label: 'música'
                ),
                NavigationDestination(
                    icon: Icon(IconSax.video_play),
                    label: 'videos'
                ),
                NavigationDestination(
                    icon: Icon(IconSax.menu),
                    label: 'menú'
                ),
              ],
            ),
          );
        },
),
    );
  }
}
