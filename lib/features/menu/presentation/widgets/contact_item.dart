import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/theme/colors.dart';
import '../../../../core/presentation/icons/icon_sax_icons.dart';
import '../../../home/presentation/bloc/url/url_bloc.dart';
import '../../../home/presentation/widgets/network_or_svg_picture.dart';
import '../../domain/entities/contact.dart';

class ContactItem extends StatelessWidget {

  final Contact contact;

  const ContactItem({Key? key, required this.contact}) : super(key: key);

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
        onTap: (contact.contactUrl!=null) ? () => context.read<UrlBloc>().add(LaunchUrl(link:contact.contactUrl!)) : null,
        child: ListTile(
          leading: NetworkOrSvgPicture(imageUrl: contact.icon,height: 50,width: 50,) ,
          trailing: (contact.contactUrl!=null) ? const Icon(IconSax.link,color: Colors.white) : null,
          title: Text(contact.name,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
          subtitle: Text(contact.job,style: TextStyle(color: Colors.white.withOpacity(0.5))),
          enabled: true,
        ),
      ),
    );
  }
}