import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final double width;
  final String name;
  final Color color;
  const AnimatedButton(
      {Key? key, required this.width, required this.name, required this.color})
      : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(20)),
      duration: Duration(seconds: 2),
      child: Center(
        child: Text(
          widget.name,
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.bold),
        ),
      ),
      height: 30,
      width: widget.width,
    );
  }
}
