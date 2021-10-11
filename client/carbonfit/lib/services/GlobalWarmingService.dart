import 'package:dio/dio.dart';

class GlobalWarmingService {
  Dio dio = new Dio();
  var baseURL = "https://global-warming.org/api/co2-api#";

  getData() async {
    var response = await dio.get('$baseURL');
    print(response.data);
  }
}
