import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/presentation/theme/colors.dart';
import '../../../home/presentation/bloc/url/url_bloc.dart';
import '../../domain/entities/social_network.dart';

class SocialNetworkMenuItem extends StatelessWidget {

  final SocialNetwork socialNetwork;

  const SocialNetworkMenuItem({Key? key, required this.socialNetwork}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: CustomColors.barBrown.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => context.read<UrlBloc>().add(LaunchUrl(link:socialNetwork.link)),
        child: ListTile(
          leading: SvgPicture.network(socialNetwork.imageUrl,colorFilter: ColorFilter.mode(socialNetwork.color, BlendMode.srcIn),),
          title: Text(socialNetwork.name,style: TextStyle(color: socialNetwork.color)),
        ),
      ),
    );
  }
}
