import 'dart:convert';
import 'dart:io';

var httpClient = new HttpClient();
final String baseUrl = "gank.io";

class Request {
  static Future<Map> get(String path, Map<String, String> params) async {
    var uri = new Uri.http(baseUrl, "/api" + path, params);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var json = await response.transform(utf8.decoder).join();
      var data = jsonDecode(json);
      return data;
    } else {
      throw new Exception("请求失败");
    }
  }
}
