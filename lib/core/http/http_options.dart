import 'package:dio/dio.dart';

class HttpOptions{

  static const devUrl = 'https://wyfv6blw.directus.app';

  static const apiUrl = devUrl;

  static Dio get dio => Dio(BaseOptions(
    baseUrl: apiUrl,
    headers: {
      "Authorization" : "Bearer e__a7D16cIeJ_Bv7phgVqp7bgMfWFTkH"
    },
  ));
}