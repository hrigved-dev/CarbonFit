import 'package:flutter/material.dart';

class AnimatedTap extends StatefulWidget {
  final double opacity;
  final String text;
  final TextStyle textStyle;
  const AnimatedTap(
      {Key? key,
      required this.opacity,
      required this.text,
      required this.textStyle})
      : super(key: key);

  @override
  _AnimatedTapState createState() => _AnimatedTapState();
}

class _AnimatedTapState extends State<AnimatedTap> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.opacity,
      duration: Duration(seconds: 3),
      child: Text(
        widget.text,
        style: widget.textStyle,
      ),
    );
  }
}
