import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  String? foodVal;
  List<String> foodHabitChoices;
  void Function(String?)? onChanged;
  CustomDropDown(
      {Key? key,
      required this.foodVal,
      required this.foodHabitChoices,
      required this.onChanged})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 4),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: widget.foodVal,
            items: widget.foodHabitChoices
                .map((foodVal) => DropdownMenuItem<String>(
                      child: Text(
                        foodVal,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      value: foodVal,
                    ))
                .toList(),
            onChanged: widget.onChanged),
      ),
    );
  }
}
