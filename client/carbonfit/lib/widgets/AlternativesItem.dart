import 'package:flutter/material.dart';

class AlternativesItem extends StatefulWidget {
  final String Transport;
  final String Electricity;
  final String Lpg;
  final String Food;
  final String Waste;
  const AlternativesItem(
      {Key? key,
      required this.Electricity,
      required this.Food,
      required this.Lpg,
      required this.Transport,
      required this.Waste})
      : super(key: key);

  @override
  _AlternativesItemState createState() => _AlternativesItemState();
}

class _AlternativesItemState extends State<AlternativesItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
