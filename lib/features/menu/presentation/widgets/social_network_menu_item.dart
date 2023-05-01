import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/social_network.dart';

class SocialNetworkMenuItem extends StatelessWidget {

  final SocialNetwork socialNetwork;

  const SocialNetworkMenuItem({Key? key, required this.socialNetwork}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.network(socialNetwork.imageUrl,colorFilter: ColorFilter.mode(socialNetwork.color, BlendMode.srcIn),),
      title: Text(socialNetwork.name,style: TextStyle(color: socialNetwork.color)),
    );
  }
}
