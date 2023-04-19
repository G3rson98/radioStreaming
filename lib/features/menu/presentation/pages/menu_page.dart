import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/social_network/social_network_bloc.dart';
import '../widgets/social_network_menu_item.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SocialNetworkBloc(context.read())..add(InitSocialNetworks()))
      ],
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            BlocBuilder<SocialNetworkBloc, SocialNetworkState>(
              builder: (context, state) {
                if(state is SocialNetworkLoaded){
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (_, index) => SocialNetworkMenuItem(socialNetwork: state.socialNetworks[index]),
                        childCount: state.socialNetworks.length
                      )
                  );
                }
                return const SliverToBoxAdapter();

              },
            )
          ],
        ),
      ),
    );
  }
}
