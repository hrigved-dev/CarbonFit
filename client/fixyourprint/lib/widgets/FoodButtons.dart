import 'package:flutter/material.dart';

class FoodButton extends StatefulWidget {
  final String label;
  Function? function;
  FoodButton({required this.label, this.function});

  @override
  _FoodButtonState createState() => _FoodButtonState();
}

class _FoodButtonState extends State<FoodButton> {
  Color _color = Colors.white;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _color = _isTapped ? Colors.white : Colors.green;
          _isTapped = !_isTapped;
          widget.function;
        });
      },
      child: Container(
        child: Center(
            child: Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.w600),
        )),
        height: 35,
        width: 150,
        decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green)),
      ),
    );
  }
}
