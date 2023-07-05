import 'package:dio/dio.dart';

class HttpOptions{

  static const _devUrl = '<<DIRECTUS URL>>';

  static const apiUrl = _devUrl;

  static Dio get dio => Dio(BaseOptions(
    baseUrl: apiUrl,

    headers: {
      "Authorization" : "<<DIRECTUS API KEY>>"
    },
  ));
}