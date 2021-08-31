import 'package:fixyourprint/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Function onPressed;
  const Button({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () => {widget.onPressed},
      color: Colors.green[700],
      child: Text(
        'LOGIN',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}
