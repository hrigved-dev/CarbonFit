import 'package:fixyourprint/models/GraphDataModel.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:fixyourprint/widgets/PieChartSections.dart';
import 'package:fixyourprint/widgets/ShimmerWidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;
  PieData pieData = PieData();
  bool _isLoading = true;
  double transportEmission = 0;
  double busEmission = 0;
  double flightEmission = 0;
  double trainEmission = 0;
  double lpgEmission = 0;
  double electricityEmission = 0;
  double wasteEmission = 0;
  double foodEmission = 0;
  List<dynamic> responsedata = [];

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getPieData();
  }

  getPieData() async {
    responsedata = await CarbonDataService().getEmission();
    transportEmission =
        double.parse(responsedata[0]['transportEmission'].toStringAsFixed(2));
    busEmission =
        double.parse(responsedata[0]['busEmission'].toStringAsFixed(2));
    flightEmission =
        double.parse(responsedata[0]['flightEmission'].toStringAsFixed(2));
    trainEmission =
        double.parse(responsedata[0]['trainEmission'].toStringAsFixed(2));
    lpgEmission =
        double.parse(responsedata[0]['lpgEmission'].toStringAsFixed(2));
    wasteEmission =
        double.parse(responsedata[0]['wasteEmission'].toStringAsFixed(2));
    foodEmission =
        double.parse(responsedata[0]['foodEmission'].toStringAsFixed(2));
    setState(() {
      _isLoading = false;
    });
    addGraphData();
  }

  addGraphData() {
    pieData.data.add(
      Data(
          parameter: 'Transport',
          footprint: transportEmission,
          color: const Color(0xffb5e48c)),
    );
    pieData.data.add(
      Data(
          parameter: 'Bus',
          footprint: busEmission,
          color: const Color(0xff99d98c)),
    );
    pieData.data.add(
      Data(
          parameter: 'Flight',
          footprint: flightEmission,
          color: const Color(0xff76c893)),
    );
    pieData.data.add(
      Data(
          parameter: 'Train',
          footprint: trainEmission,
          color: const Color(0xff52b69a)),
    );
    pieData.data.add(
      Data(
          parameter: 'LPG',
          footprint: lpgEmission,
          color: const Color(0xff34a0a4)),
    );
    pieData.data.add(
      Data(
          parameter: 'Electricity',
          footprint: electricityEmission,
          color: const Color(0xff168aad)),
    );
    pieData.data.add(
      Data(
          parameter: 'Waste',
          footprint: wasteEmission,
          color: const Color(0xff1a759f)),
    );
    pieData.data.add(
      Data(
          parameter: 'Food',
          footprint: foodEmission,
          color: const Color(0xff1e6091)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? buildGraphShimmer()
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
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    }),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: getSections(touchedIndex, pieData),
                  ),
                ),
              ),
            ),
          );
  }

  Widget buildGraphShimmer() => ListTile(
          title: ShimmerWidget.card(
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ));
}
