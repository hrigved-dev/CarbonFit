import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValueSlider extends StatefulWidget {
  double min;
  double max;
  double sliderVal;
  int? divisions;
  void Function(double)? onChanged;
  ValueSlider(
      {Key? key,
      required this.min,
      required this.sliderVal,
      required this.max,
      required this.divisions,
      required this.onChanged})
      : super(key: key);

  @override
  _ValueSliderState createState() => _ValueSliderState();
}

class _ValueSliderState extends State<ValueSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          trackHeight: 16,
          thumbColor: Colors.green[900],
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
          valueIndicatorColor: Colors.green[300],
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.green[900]),
      child: Slider(
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          value: widget.sliderVal,
          label: widget.sliderVal.round().toString(),
          onChanged: widget.onChanged),
    );
  }
}
