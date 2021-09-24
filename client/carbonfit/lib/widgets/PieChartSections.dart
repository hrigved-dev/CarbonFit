import 'package:fixyourprint/models/GraphDataModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> getSections(int touchedIndex) => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final isTouched = index == touchedIndex;
      final double fontSize = isTouched ? 16 : 12;
      final double radius = isTouched ? 150 : 100;
      final FontWeight fontWeight =
          isTouched ? FontWeight.bold : FontWeight.normal;

      final value = PieChartSectionData(
        color: data.color,
        value: data.footprint,
        title: '${data.footprint}',
        radius: radius,
        titleStyle: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: const Color(0xffffffff),
        ),
      );

      return MapEntry(index, value);
    })
    .values
    .toList();
