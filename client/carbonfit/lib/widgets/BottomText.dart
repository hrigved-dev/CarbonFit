import 'package:fixyourprint/widgets/TapText.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String text;
  final String tapText;
  final Widget screen;
  const BottomText(
      {Key? key,
      required this.text,
      required this.tapText,
      required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontFamily: 'Lato', fontSize: 15),
        ),
        TapText(
          tapText: ' $tapText',
          nextScreen: screen,
        ),
      ],
    );
  }
}
