import '../../../../core/http/entities/http_response.dart';
import '../entities/audio_item.dart';

abstract class RadioRepository{
  Future<HttpResponse<AudioItem>> getRadio();
}