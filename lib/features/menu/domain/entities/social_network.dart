import 'package:flutter/material.dart';

class SocialNetwork{
  final int id;
  final String name;
  final String link;
  final Color color;
  final String imageUrl;

  SocialNetwork({
    required this.id,
    required this.name,
    required this.link,
    required this.color,
    required this.imageUrl
  });
}