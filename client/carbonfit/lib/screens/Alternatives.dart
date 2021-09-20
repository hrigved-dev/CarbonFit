import 'package:flutter/material.dart';

class Alternatives extends StatefulWidget {
  const Alternatives({Key? key}) : super(key: key);

  @override
  _AlternativesState createState() => _AlternativesState();
}

class _AlternativesState extends State<Alternatives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Alternatives')),
    );
  }
}
