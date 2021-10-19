import 'dart:ui';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:fixyourprint/widgets/DashboardData.dart';
import 'package:fixyourprint/widgets/FootprintText.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final Widget? child;
  const Dashboard({Key? key, this.child}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double footprint = 0.0;
  bool _isLoading = true;
  String name = '';
  Color color = Colors.black;
  List<dynamic> responseData = [];

  getProfile() async {
    name = await AuthService().getProfile();
    setState(() {
      _isLoading = false;
    });
  }

  getTotalEmission() async {
    _isLoading = true;
    responseData = await CarbonDataService().getEmission();
    footprint = responseData[0]['total'];
    footprint = double.parse(footprint.toStringAsFixed(2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    // getParameterEmission();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? GreenLoader()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello $name, your footprint is...",
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                FootprintText(),
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
