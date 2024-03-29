import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/icons/icon_sax_icons.dart';
import '../bloc/announcement_bloc.dart';
import 'announcement_item.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (context, state) {
        if( state is AnnouncementLoaded){
          return SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: state.announcements.length,
                      (_, i) => AnnouncementItem(
                    announcement: state.announcements[i],
                  )
              ),
            ),
          );
        }

        if(state is AnnouncementEmpty){
          return SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(IconSax.notification,size: 64,color: CustomColors.cornFlower),
                const SizedBox(height: 20),
                Text('No hay anuncios',style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.barBrown.withOpacity(0.5)
                  ),
                  onPressed: ()=> context.read<AnnouncementBloc>().add(GetAllAnnouncements()),
                  child: const Text('Verificar si hay nuevos anuncios'),
                )
              ],
            ),
          );
        }

        return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator.adaptive())
        );

      },
    );
  }
}
