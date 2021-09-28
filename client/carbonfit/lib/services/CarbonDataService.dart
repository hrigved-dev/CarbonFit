import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarbonDataService {
  Dio dio = Dio();

  var baseURL = 'http://localhost:3000';

  emissionCalculation(
      double numberofPeople,
      double transportVal,
      double busVal,
      double flightVal,
      double trainVal,
      double lpgVal,
      double electricityVal,
      double wasteVal,
      String foodVal) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.post("$baseURL/carbon", data: {
        "numberofPeople": numberofPeople,
        "transport": transportVal,
        "bus": busVal,
        "flight": flightVal,
        "train": trainVal,
        "lpg": lpgVal,
        'electricity': electricityVal,
        "waste": wasteVal,
        "food": foodVal
      });
      if (response.statusCode == 201) {
        // await sharedPreferences.setInt('id', response.data['id']);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('_id', response.data[0]['_id']);
        return response.data;
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  getEmission() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.get('$baseURL/carbon');
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  updateEmission(
      double numberofPeople,
      double transportVal,
      double busVal,
      double flightVal,
      double trainVal,
      double lpgVal,
      double electricityVal,
      double wasteVal,
      String foodVal) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString('_id');
    var token = sharedPreferences.getString('token');
    print(id);
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.patch('$baseURL/carbon/$id', data: {
        "numberofPeople": numberofPeople,
        "transport": transportVal,
        "bus": busVal,
        "flight": flightVal,
        "train": trainVal,
        "lpg": lpgVal,
        'electricity': electricityVal,
        "waste": wasteVal,
        "food": foodVal
      });
      if (response.statusCode == 200) {
        print(response.data);
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
      var response = await dio.get('$baseURL/carbon');
      print(response.data[0]['_id']);
      var id = response.data[0]['_id'];
      await sharedPreferences.setString('_id', id);
      return response.data[0]['total'];
    } on DioError catch (e) {
      print(e);
    }
  }
}
