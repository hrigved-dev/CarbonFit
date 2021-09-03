import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green[700],
        ),
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
