import '../../domain/entities/audio_item.dart';

class RadioModel extends AudioItem{
  RadioModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.image,
    required super.file
  });

  factory RadioModel.fromJson(Map<String,dynamic> json) =>
      RadioModel(
          id: json["data"]["id"],
          title: json["data"]["title"],
          subTitle: json["data"]["subtitle"],
          image: json["data"]["image"],
          file: json["data"]["url"]
      );

}