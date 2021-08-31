import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  final String labelText;
  final Function onChanged;
  const FormFieldWidget(
      {Key? key, required this.labelText, required this.onChanged})
      : super(key: key);

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged(),
      decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          )),
    );
  }
}
