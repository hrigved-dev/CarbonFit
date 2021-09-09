import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarbonDataService {
  Dio dio = Dio();

  var baseURL = 'http://10.0.2.2:3000';

  electricityEmission(double electricity) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.post("$baseURL/carbon/electricity",
          data: {"electricity": electricity});
      if (response.statusCode == 201) {
        return response.data['electricity'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  transportEmission(double transport) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio
          .post("$baseURL/carbon/transport", data: {"transport": transport});
      if (response.statusCode == 201) {
        return response.data['transport'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  busEmission(double bus) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.post("$baseURL/carbon/bus", data: {"bus": bus});
      if (response.statusCode == 201) {
        return response.data['bus'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  flightEmission(double flight) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response =
          await dio.post("$baseURL/carbon/flight", data: {"flight": flight});
      if (response.statusCode == 201) {
        return response.data['flight'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  trainEmission(double train) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response =
          await dio.post("$baseURL/carbon/train", data: {"train": train});
      if (response.statusCode == 201) {
        return response.data['train'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  lpgEmission(double lpg) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.post("$baseURL/carbon/lpg", data: {"lpg": lpg});
      if (response.statusCode == 201) {
        return response.data['lpg'];
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  wasteEmission(double waste) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response =
          await dio.post("$baseURL/carbon/waste", data: {"waste": waste});
      if (response.statusCode == 201) {
        return response.data['waste'];
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
      var response = await dio.get("$baseURL/carbon");
      if (response.statusCode == 201) {
        var total = response.data[7]['total'];
        return total;
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
