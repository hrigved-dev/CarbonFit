import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();
  var baseURL = "https://carbonfit-api.herokuapp.com/";

  getUsers() async {
    var response = await dio.get("$baseURL/users");
    print(response.data.toString());
  }

  loginUser(String email, String password) async {
    try {
      var response = await dio.post(
        "https://carbonfit-api.herokuapp.com/users/login",
        data: {"email": email, "password": password},
        // options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('token', response.data['token']);
        return response.data['token'];
      } else {
        print(response.data['error']);
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  createUser(String name, String email, String password) async {
    try {
      var response = await dio.post(
        "https://carbonfit-api.herokuapp.com/users/createUser",
        data: {"name": name, "email": email, "password": password},
        // options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      if (response.statusCode == 201) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('token', response.data['token']);
        return response.data['token'];
      } else {
        print(response.data['error']);
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    return token;
  }

  logoutUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response =
          await dio.post('https://carbonfit-api.herokuapp.com/users/logout');
      if (response.statusCode == 200) {
        print('Log out Successful');
        preferences.remove('token');
        print(preferences.getString('token'));
        return response.data;
      }
    } on DioError catch (e) {
      print('Log out Error $e');
    }
  }

  getProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response =
          await dio.get('https://carbonfit-api.herokuapp.com/users/me');
      if (response.statusCode == 200) {
        return response.data['name'];
        // User user = User(
        //   name: response.data['name'],
        //   email: response.data['email'],
        // );
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
