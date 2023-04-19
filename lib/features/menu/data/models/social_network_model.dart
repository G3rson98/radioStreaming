import '../../../../core/http/http_options.dart';
import '../../domain/entities/social_network.dart';

class SocialNetworkModel extends SocialNetwork{
  SocialNetworkModel({
    required super.id,
    required super.name,
    required super.link,
    required super.imageUrl
  });

  factory SocialNetworkModel.fromJson(Map<String,dynamic> json) => SocialNetworkModel(
    id: json["id"],
    name: json["name"],
    link: json["url"],
    imageUrl: '${HttpOptions.apiUrl}/assets/${json["icon"]}'
  );
}