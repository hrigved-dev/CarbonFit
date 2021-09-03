import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final double width;
  final String name;
  final Color color;
  final double fontSize;
  final void Function()? onTap;
  const AnimatedButton(
      {Key? key,
      required this.width,
      required this.name,
      required this.color,
      required this.fontSize,
      this.onTap})
      : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(20)),
        duration: Duration(seconds: 2),
        child: Center(
            child: AnimatedDefaultTextStyle(
                child: Text(widget.name),
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Colors.white,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
                duration: Duration(seconds: 2))),
        height: 30,
        width: widget.width,
      ),
    );
  }
}
