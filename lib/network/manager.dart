import 'request.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance => getInstance();

  static NetworkManager getInstance() {
    if (_instance == null) {
      _instance = NetworkManager._internal();
    }
    return _instance;
  }

  NetworkManager._internal();

  Future<Map> fetchMainData() {
    return Request.getUrl("http://api.douban.com/v2/movie/top250");
  }
}
