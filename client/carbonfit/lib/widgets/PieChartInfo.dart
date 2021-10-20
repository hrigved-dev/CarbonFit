import 'package:fixyourprint/widgets/BarGraphInfo.dart';
import 'package:flutter/material.dart';

class PieChartInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BarGraphInfo(
          barinfo: 'Transport',
          color: Color(0xffb5e48c),
        ),
        BarGraphInfo(
          barinfo: "Bus",
          color: Color(0xff99d98c),
        ),
        BarGraphInfo(
          barinfo: 'Flight',
          color: Color(0xff76c893),
        ),
        BarGraphInfo(
          barinfo: 'Train',
          color: Color(0xff52b69a),
        ),
        BarGraphInfo(
          barinfo: 'LPG',
          color: Color(0xff34a0a4),
        ),
        BarGraphInfo(
          barinfo: 'Elec',
          color: Color(0xff168aad),
        ),
        BarGraphInfo(
          barinfo: 'Waste',
          color: Color(0xff1a759f),
        ),
        BarGraphInfo(
          barinfo: 'Food',
          color: Color(0xff1e6091),
        ),
      ],
    );
  }
}
