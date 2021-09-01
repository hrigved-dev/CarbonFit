import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  final String labelText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Icon? suffixIcon;
  final TextInputType keyboardType;
  FormFieldWidget(
      {required this.labelText,
      required this.onChanged,
      required this.obscureText,
      this.suffixIcon,
      required this.keyboardType});

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          )),
    );
  }
}
