import '../../../radio/domain/entities/audio_item.dart';

class HistoryModel extends AudioItem{
  HistoryModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.image,
    required super.file
  });

  factory HistoryModel.fromJson(Map<String,dynamic> json) =>
      HistoryModel(
          id: json["id"],
          title: json["title"],
          subTitle: json["subtitle"],
          image: json["image"],
          file: json["file"]
      );
}