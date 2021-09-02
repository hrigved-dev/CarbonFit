import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dio = new Dio();

  getUsers() async {
    var response = await dio.get('http://10.0.2.2:3000/users');
    print(response.data.toString());
  }

  loginUser(String email, String password) async {
    try {
      var response = await dio.post(
        'http://10.0.2.2:3000/users/login',
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
    } on DioError catch (e) {}
  }

  createUser(email, name, password) async {
    try {
      var response = await dio.post(
        'http://10.0.2.2:3000/users',
        data: {"name": name, "email": email, "password": password},
        // options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        print('Error');
      }
    } on DioError catch (e) {}
  }

  logoutUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    dio.options.headers['authorization'] = "Bearer $token";
    try {
      var response = await dio.post('http://10.0.2.2:3000/users/logout');
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      print('Error');
    }
  }
}
