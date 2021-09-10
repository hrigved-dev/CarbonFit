import 'package:flutter/material.dart';

class FoodButton extends StatefulWidget {
  final String label;
  // void Function()? onTap;
  FoodButton({required this.label});

  @override
  _FoodButtonState createState() => _FoodButtonState();
}

class _FoodButtonState extends State<FoodButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        widget.label,
        style: TextStyle(fontWeight: FontWeight.w600),
      )),
      height: 35,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green)),
    );
  }
}
