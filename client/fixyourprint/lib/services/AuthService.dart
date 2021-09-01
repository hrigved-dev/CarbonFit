import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fixyourprint/models/UserModel.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Dio dio = new Dio();

  // getUsers() async {
  //   var response = await dio.get('http://10.0.2.2:3000/users');
  //   print(response.data.toString());
  // }

  loginUser(String email, String password) async {
    try {
      var response = await dio.post(
        'http://10.0.2.2:3000/users/login',
        data: {"email": email, "password": password},
        // options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        print('Error');
      }
    } on DioError catch (e) {}
  }

  createUser(email, name, password) async {
    try {
      return await dio.post(
        'http://10.2.2:3000/users',
        data: {"name": name, "email": email, "password": password},
        // options: Options(contentType: Headers.formUrlEncodedContentType)
      );
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
