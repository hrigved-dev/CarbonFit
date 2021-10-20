import 'package:fixyourprint/models/GlobalWarmingModel.dart';
import 'package:fixyourprint/services/GlobalWarmingService.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:fixyourprint/widgets/ShimmerWidget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<GlobalWarmingModel> chartData = [];
  bool _isLoading = true;
  GlobalWarmingService globalWarmingService = GlobalWarmingService();

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getChartData();
  }

  getChartData() async {
    await globalWarmingService.getData();
    chartData = globalWarmingService.globalWarming;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? buildLineGraphShimmer()
        : SfCartesianChart(
            series: <ChartSeries>[
              LineSeries<GlobalWarmingModel, double>(
                  dataSource: chartData,
                  xValueMapper: (GlobalWarmingModel data, _) =>
                      double.parse(data.year),
                  yValueMapper: (GlobalWarmingModel data, _) =>
                      double.parse(data.trend))
            ],
          );
  }

  buildLineGraphShimmer() => ListTile(
          title: ShimmerWidget.card(
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ));
}
