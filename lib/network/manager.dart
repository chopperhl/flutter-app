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

  NetworkManager._internal() {
    print("init");
  }

  Future<Map> fetchMainData() {
    return Request.get("/data/福利/100/1", {});
  }
}
