import 'package:dio/dio.dart';

class ChatbotService {
  Dio dio = new Dio();
  var baseURL = "http://127.0.0.1:5000/question";
  List<String> data = [];

  getResponse(String data) async {
    try {
      var response = await dio.post(baseURL, data: {'data': data});
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
