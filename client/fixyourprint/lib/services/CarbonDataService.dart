import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarbonDataService {
  Dio dio = Dio();

  var baseURL = 'http://10.0.2.2:3000';

  emissionCalculation(String parameter, double value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio
          .post("$baseURL/carbon/$parameter", data: {"$parameter": value});
      if (response.statusCode == 201) {
        return response.data['$parameter'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  foodEmission(String food) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response =
          await dio.post("$baseURL/carbon/food", data: {"food": food});
      if (response.statusCode == 201) {
        return response.data['food'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  totalEmission() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.get('http://10.0.2.2:3000/carbon');
      return response.data[7]['total'];
    } on DioError catch (e) {
      print(e);
    }
  }
}
