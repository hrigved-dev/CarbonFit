import 'package:fixyourprint/widgets/BarGraphWidget.dart';
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
        children: [
          GraphWidget(
            footprint: widget.footprint,
          ),
          PieChartWidget(),
        ],
      ),
    ));
  }
}

// Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
                  
//                   Container(
//                     height: 400,
//                     width: 400,
//                     child: Card(
//                       elevation: 4,
//                       color: Colors.lightGreen[100],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(32),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),