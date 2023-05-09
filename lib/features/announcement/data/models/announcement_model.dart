import '../../../../core/http/http_options.dart';
import '../../domain/entities/announcement.dart';

class AnnouncementModel extends Announcement{
  AnnouncementModel({required super.id, required super.title, required super.image, required super.description});

  factory AnnouncementModel.fromJson(Map<String,dynamic> json) =>
      AnnouncementModel(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          image: '${HttpOptions.apiUrl}/assets/${json["image"]}?height=500',
      );

}