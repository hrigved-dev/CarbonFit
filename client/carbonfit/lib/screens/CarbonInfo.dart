import 'package:flutter/material.dart';

class CarbonInfo extends StatefulWidget {
  const CarbonInfo({Key? key}) : super(key: key);

  @override
  _CarbonInfoState createState() => _CarbonInfoState();
}

class _CarbonInfoState extends State<CarbonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CO2 Info')),
    );
  }
}
