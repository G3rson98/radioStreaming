import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/bloc/url/url_bloc.dart';
import '../bloc/contact/contact_bloc.dart';
import '../bloc/social_network/social_network_bloc.dart';
import '../widgets/contact_item.dart';
import '../widgets/menu_title.dart';
import '../widgets/social_network_menu_item.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SocialNetworkBloc(context.read())..add(InitSocialNetworks())),
        BlocProvider(create: (context) => ContactBloc(context.read())..add(InitContacts())),
        BlocProvider(create: (context) => UrlBloc(context.read(),context.read()))
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              const MenuTitle(text: 'Redes sociales'),
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
              ),
              const MenuTitle(text: 'Contacto'),
              BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  if(state is ContactLoaded){
                    return SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (_, index) => ContactItem(contact: state.contacts[index]),
                            childCount: state.contacts.length
                        )
                    );
                  }
                  return const SliverToBoxAdapter();
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
