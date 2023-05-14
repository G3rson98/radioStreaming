import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/presentation/theme/colors.dart';
import '../../../home/presentation/bloc/url/url_bloc.dart';
import '../../../home/presentation/widgets/network_or_svg_picture.dart';
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
          leading: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 30,maxHeight: 30),
              child: NetworkOrSvgPicture(imageUrl: socialNetwork.imageUrl,svgColor: socialNetwork.color)
          ),
          title: Text(socialNetwork.name,style: TextStyle(color: socialNetwork.color)),
        ),
      ),
    );
  }
}
