import 'package:dio/dio.dart';

class ChatbotService {
  Dio dio = new Dio();
  var baseURL = "http://127.0.0.1:5000/question";
  List<String> data = [];
}
