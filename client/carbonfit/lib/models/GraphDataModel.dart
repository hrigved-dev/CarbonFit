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
