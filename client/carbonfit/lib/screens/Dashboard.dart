import 'dart:ui';
// import 'package:fixyourprint/models/GraphDataModel.dart';
import 'package:fixyourprint/models/GraphDataModel.dart';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:fixyourprint/widgets/BarGraphWidget.dart';
import 'package:fixyourprint/widgets/DashboardData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Dashboard extends StatefulWidget {
  final Widget? child;
  const Dashboard({Key? key, this.child}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double footprint = 0;
  bool _isLoading = false;
  String name = '';

  getProfile() async {
    name = await AuthService().getProfile();
    setState(() {
      _isLoading = false;
    });
  }

  getEmission() async {
    footprint = await CarbonDataService().totalEmission();
    footprint = double.parse(footprint.toStringAsFixed(2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    // getEmission();
    // getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello $name, your footprint is...",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                footprint.toString() + ' ',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
              Text(
                "tonnes CO2/year",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DashboardData(
            footprint: footprint,
          ),
        ],
      ),
    );
  }
}
