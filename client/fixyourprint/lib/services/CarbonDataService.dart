import 'package:dio/dio.dart';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarbonDataService {
  Dio dio = Dio();

  var baseURL = 'http://10.0.2.2:3000';

  electricityEmission() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.post("$baseURL/carbon/electricity");
      if (response.statusCode == 201) {
        print(response.data);
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  transportEmission() async {}

  busEmission() async {}

  flightEmission() async {}

  trainEmission() async {}

  lpgEmission() async {}

  wasteEmission() async {}

  foodEmission() async {}
}
