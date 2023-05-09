import 'package:dio/dio.dart';

class HttpOptions{

  static const _devUrl = 'https://directus.elroir.cloud';

  static const apiUrl = _devUrl;

  static Dio get dio => Dio(BaseOptions(
    baseUrl: apiUrl,
    headers: {
      "Authorization" : "Bearer qPERwt_qoreC62Vjtp5GuTZlCWYX7lsK"
    },
  ));
}