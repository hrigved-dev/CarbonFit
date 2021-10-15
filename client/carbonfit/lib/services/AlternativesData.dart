import 'package:dio/dio.dart';
import 'package:fixyourprint/models/AlternativesDataModel.dart';
import 'package:fixyourprint/models/OffsetDataModel.dart';

class AlternativesDataProcess {
  Dio dio = new Dio();
  var baseURL = "https://carbonfit-api.herokuapp.com/alternatives";
  List<AlternativesDataModel> alternativesDataList = [];

  Future<List<AlternativesDataModel>> getData() async {
    var response = await dio.get('$baseURL');
    var data = response.data;

    if (response.statusCode == 200) {
      for (int i = 0; i < data.length; i++) {
        AlternativesDataModel alternativesDataModel = AlternativesDataModel(
            Electricity: data[i]["Electricity"],
            Food: data[i]["Food"],
            Lpg: data[i]["Lpg"],
            Transport: data[i]["Transport"],
            Waste: data[i]["Waste"]);
        alternativesDataList.add(alternativesDataModel);
      }
    }
    print(alternativesDataList);
    return alternativesDataList;
  }
}
