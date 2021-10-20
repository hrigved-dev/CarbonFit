import 'package:dio/dio.dart';
import 'package:fixyourprint/models/GlobalWarmingModel.dart';

class GlobalWarmingService {
  Dio dio = new Dio();
  var baseURL = "https://global-warming.org/api/co2-api#";
  List<GlobalWarmingModel> globalWarming = [];

  Future<void> getData() async {
    var response = await dio.get('$baseURL');
    var data = response.data['co2'];

    if (response.statusCode == 200) {
      for (int i = 0; i < data.length; i++) {
        GlobalWarmingModel globalWarmingModel =
            GlobalWarmingModel(year: data[i]["year"], trend: data[i]["trend"]);
        // cycle: data[i]["cycle"],
        // day: data[i]["day"],
        // month: data[i]["month"]);
        globalWarming.add(globalWarmingModel);
      }
    }
  }
}
