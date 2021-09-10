import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double total = 0;

  @override
  void initState() {
    super.initState();
    getTotal();
  }

  getTotal() async {
    return await CarbonDataService().totalEmission().then((value) {
      total = value;
      print(total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is Dashboard and total is $total'),
      ),
    );
  }
}
