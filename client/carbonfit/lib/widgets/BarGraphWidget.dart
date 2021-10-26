import 'package:fixyourprint/models/GraphDataModel.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:fixyourprint/widgets/ShimmerWidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatefulWidget {
  final double footprint;
  const GraphWidget({Key? key, required this.footprint}) : super(key: key);

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  FootprintBarData barDataClass = FootprintBarData();
  bool _isLoading = false;
  double footprint = 0.0;
  List<dynamic> responseData = [];

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getFootprint();
  }

  getFootprint() async {
    responseData = await CarbonDataService().getEmission();
    footprint = responseData[0]['total'];
    footprint = double.parse(footprint.toStringAsFixed(2));
    setState(() {
      _isLoading = false;
      addGraphData();
    });
  }

  addGraphData() {
    barDataClass.barData.add(
      GraphDataModel(
          id: 0, footprint: footprint, owner: 'Your', color: Color(0xFF22577A)),
    );
    barDataClass.barData.add(
      GraphDataModel(
          id: 1, footprint: 1.75, owner: 'India Avg', color: Color(0XFF38A3A5)),
    );
    barDataClass.barData.add(
      GraphDataModel(
          id: 2, footprint: 4.05, owner: 'World Avg', color: Color(0XFF57CC99)),
    );
    barDataClass.barData.add(
      GraphDataModel(
          id: 3, footprint: 1.2, owner: 'Target', color: Colors.green),
    );
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? buildOffsetShimmer()
        : Container(
            height: 400,
            width: 400,
            child: Card(
              elevation: 4,
              color: Color(0XFFF3EFCC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    maxY: 5,
                    minY: 0,
                    groupsSpace: 30,
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      bottomTitles: SideTitles(
                        showTitles: true,
                        margin: 10,
                        getTextStyles: (context, value) => const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                        getTitles: (double id) => barDataClass.barData
                            .firstWhere((element) => element.id == id.toInt())
                            .owner,
                      ),
                      topTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    gridData: FlGridData(
                      checkToShowHorizontalLine: (value) =>
                          value % FootprintBarData.interval == 0,
                      getDrawingHorizontalLine: (value) {
                        if (value == 0) {
                          return FlLine(
                            color: Colors.amber,
                            strokeWidth: 3,
                          );
                        } else {
                          return FlLine(
                            color: Colors.red,
                            strokeWidth: 0.8,
                          );
                        }
                      },
                    ),
                    barGroups: barDataClass.barData
                        .map(
                          (data) => BarChartGroupData(
                            x: data.id,
                            barRods: [
                              BarChartRodData(
                                y: data.footprint,
                                width: 28,
                                colors: [data.color],
                                borderRadius: data.footprint > 0
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                      )
                                    : BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          );
  }

  Widget buildOffsetShimmer() => ListTile(
          title: ShimmerWidget.card(
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ));
}
