import 'package:flutter/material.dart';

class AnimatedTap extends StatefulWidget {
  final double opacity;
  const AnimatedTap({Key? key, required this.opacity}) : super(key: key);

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
        'Tap to Start',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
