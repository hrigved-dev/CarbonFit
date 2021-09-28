import 'package:flutter/material.dart';

class GraphDataModel {
  final int id;
  final double footprint;
  final String owner;
  final Color color;
  const GraphDataModel(
      {required this.id,
      required this.footprint,
      required this.owner,
      required this.color});
}

class FootprintBarData {
  static double interval = 1;

  List<GraphDataModel> barData = [];
}

class PieData {
  List<Data> data = [
    // Data(
    //     parameter: 'Transport', footprint: 1.2, color: const Color(0xffb5e48c)),
    // Data(parameter: 'Bus', footprint: 0, color: const Color(0xff99d98c)),
    // Data(parameter: 'Flight', footprint: 0.28, color: const Color(0xff76c893)),
    // Data(parameter: 'Train', footprint: 0.206, color: const Color(0xff52b69a)),
    // Data(parameter: 'LPG', footprint: 0.357, color: const Color(0xff34a0a4)),
    // Data(
    //     parameter: 'Electricity',
    //     footprint: 0.32,
    //     color: const Color(0xff168aad)),
    // Data(parameter: 'Waste', footprint: 0.009, color: const Color(0xff1a759f)),
    // Data(parameter: 'Food', footprint: 1.79, color: const Color(0xff1e6091)),
  ];
}

class Data {
  final String parameter;
  final double footprint;
  final Color color;

  Data({required this.parameter, required this.footprint, required this.color});
}
