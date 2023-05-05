import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/theme/icon_sax_icons.dart';
import '../../../../core/router/router.dart';
import '../bloc/navigation_bar_cubit.dart';

class MenuBottomBar extends StatelessWidget {
  const MenuBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: BlocConsumer<NavigationBarCubit, int>(
          listener: (_,state){
            if(state==0){
              context.go(Routes.radio);
            }
            if(state==2){
              context.go(Routes.video);
            }
            if(state==3){
              context.go(Routes.menu);
            }
          },
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
                      icon: Icon(IconSax.notification),
                      label: 'anuncios'
                  ),
                  NavigationDestination(
                      icon: Icon(IconSax.video_play),
                      label: 'películas'
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
      ),
    );
  }
}
