import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String token;
  WelcomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('WelcomeScreen and token is ' + token),
      ),
    );
  }
}
