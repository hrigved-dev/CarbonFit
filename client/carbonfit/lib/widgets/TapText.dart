import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class TapText extends StatefulWidget {
  late String tapText;
  late Widget nextScreen;
  TapText({required this.tapText, required this.nextScreen});

  @override
  _TapTextState createState() => _TapTextState();
}

class _TapTextState extends State<TapText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: widget.nextScreen,
                type: PageTransitionType.leftToRight));
      },
      child: Text(
        widget.tapText,
        style: TextStyle(fontFamily: 'Lato', color: Colors.green, fontSize: 15),
      ),
    );
  }
}
