import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: MediaQuery.of(context).size.width,
      onPressed: onPressed,
      color: Colors.green[700],
      child: Text(
        'LOGIN',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}
