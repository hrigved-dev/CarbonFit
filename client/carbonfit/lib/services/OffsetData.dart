import 'package:dio/dio.dart';
import 'package:fixyourprint/models/OffsetDataModel.dart';

class OffsetData {
  Dio dio = new Dio();
  var baseURL = "https://carbonfit-api.herokuapp.com/offset";
  List<OffsetDataModel> offsetDataList = [];

  Future<void> getData() async {
    var response = await dio.get('$baseURL');
    var data = response.data;

    if (response.statusCode == 200) {
      for (int i = 0; i < data.length; i++) {
        OffsetDataModel offsetDataModel = OffsetDataModel(
            Name: data[i]["Name"],
            Id: data[i]["Id"],
            Brief: data[i]["Brief"],
            Min: data[i]["Min"],
            Availability: data[i]["Availability"],
            Image: data[i]["Image"],
            Link: data[i]["Link"]);
        offsetDataList.add(offsetDataModel);
      }
    }
  }
}
