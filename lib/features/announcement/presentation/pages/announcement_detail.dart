import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../home/presentation/widgets/banner_ad.dart';
import '../bloc/detail/announcement_detail_bloc.dart';

class AnnouncementDetailPage extends StatelessWidget {
  const AnnouncementDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AnnouncementDetailBloc, AnnouncementDetailState>(
        builder: (context, state) {
          if(state is AnnouncementDetailLoaded){
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.announcement.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Hero(
                          tag: 'announcement${state.announcement.id}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: InteractiveViewer(
                              maxScale: 2.0,
                              minScale: 0.5,
                              child: Image.network(state.announcement.image,height: 250,width: double.infinity,fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Html(
                          data: state.announcement.description,
                        ),
                        const SizedBox(height: 60)
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                    child: BannerAdWidget()
                )
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
