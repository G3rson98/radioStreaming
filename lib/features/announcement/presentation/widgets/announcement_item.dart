import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../core/router/router.dart';
import '../../domain/entities/announcement.dart';
class AnnouncementItem extends StatelessWidget {

  final Announcement announcement;

  const AnnouncementItem({Key? key, required this.announcement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => context.push('${Routes.announcementDetail}/${announcement.id}',extra: announcement),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(announcement.title,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(announcement.image,height: 200,width: double.infinity,fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: Markdown(
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
                physics: const NeverScrollableScrollPhysics(),
                data: announcement.description,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
