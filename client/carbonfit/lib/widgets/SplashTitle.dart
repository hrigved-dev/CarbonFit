import 'package:flutter/material.dart';

class SplashTitle extends StatelessWidget {
  final String title;
  const SplashTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}
