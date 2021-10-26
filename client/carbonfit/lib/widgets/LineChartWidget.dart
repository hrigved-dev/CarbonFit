import 'package:fixyourprint/models/GlobalWarmingModel.dart';
import 'package:fixyourprint/services/GlobalWarmingService.dart';
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
  TooltipBehavior _tooltipBehavior = TooltipBehavior();

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
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
            title: ChartTitle(text: 'CO2 levels from 2011-present in ppm'),
            tooltipBehavior: _tooltipBehavior,
            legend: Legend(isVisible: true),
            series: <ChartSeries>[
              LineSeries<GlobalWarmingModel, double>(
                  enableTooltip: true,
                  name: 'CO2 conc.(ppm)',
                  dataSource: chartData,
                  color: Colors.green.shade700,
                  width: 3,
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
