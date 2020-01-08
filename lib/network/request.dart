import 'dart:io';

import 'package:dio/dio.dart';

class Request {
  static final Dio dio = Dio();

  static Future<Map> getUrl(String url) async {
    Response<Map> response = await dio.get(url,
        queryParameters: {"apikey": "0df993c66c0c636e29ecbb5344252a4a"});
    print(response.data);
    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else {
      throw Exception("请求失败");
    }
  }
}
