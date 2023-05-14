
import 'package:flutter/material.dart';

import '../../../../core/extension/color_extensions.dart';
import '../../../../core/http/http_options.dart';
import '../../domain/entities/social_network.dart';

class SocialNetworkModel extends SocialNetwork{
  SocialNetworkModel({
    required super.id,
    required super.name,
    required super.link,
    required super.color,
    required super.imageUrl
  });

  factory SocialNetworkModel.fromJson(Map<String,dynamic> json) => SocialNetworkModel(
    id: json["id"],
    name: json["name"],
    link: json["url"],
    color: json["color"] != null ? HexColor.fromHex(json["color"]) : Colors.white,
    imageUrl: '${HttpOptions.apiUrl}/assets/${json["icon"]}'
  );
}