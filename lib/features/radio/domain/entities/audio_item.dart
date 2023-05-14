import '../../../../core/http/http_options.dart';

class AudioItem{
  final int id;
  final String title;
  final String subTitle;
  final String image;
  final String file;

  AudioItem({
    required this.id,
    required this.title,
    this.subTitle = '',
    required this.image,
    required this.file
  });


  String getImage({int? width,int? height}){
    if(width==null||height==null){
      return '${HttpOptions.apiUrl}/assets/$image';
    }
    return '${HttpOptions.apiUrl}/assets/$image?height=$height&width=$width';
  }
}