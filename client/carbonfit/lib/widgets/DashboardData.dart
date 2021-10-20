import 'package:fixyourprint/widgets/BarGraphInfo.dart';
import 'package:fixyourprint/widgets/BarGraphWidget.dart';
import 'package:fixyourprint/widgets/PieChartInfo.dart';
import 'package:fixyourprint/widgets/PieChartWidget.dart';
import 'package:flutter/material.dart';

class DashboardData extends StatefulWidget {
  final double footprint;
  const DashboardData({Key? key, required this.footprint}) : super(key: key);

  @override
  _DashboardDataState createState() => _DashboardDataState();
}

class _DashboardDataState extends State<DashboardData> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GraphWidget(
            footprint: widget.footprint,
          ),
          SizedBox(
            height: 10,
          ),
          BarGraphInfo(
            barinfo: 'Your Footprint',
            color: Color(0xFF22577A),
          ),
          BarGraphInfo(
            barinfo: "India Average Footprint",
            color: Color(0XFF38A3A5),
          ),
          BarGraphInfo(
            barinfo: 'World Average Footprint',
            color: Color(0XFF57CC99),
          ),
          BarGraphInfo(
            barinfo: 'Target Footprint',
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Emission by each parameter: ',
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          PieChartWidget(),
          SizedBox(
            height: 15,
          ),
          PieChartInfo(),
        ],
      ),
    ));
  }
}
