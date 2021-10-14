import 'package:flutter/material.dart';

class AlternativesScreen extends StatefulWidget {
  const AlternativesScreen({Key? key}) : super(key: key);

  @override
  _AlternativesScreenState createState() => _AlternativesScreenState();
}

class _AlternativesScreenState extends State<AlternativesScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alternatives",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Here are some alternatives to reduce your carbon emission",
            style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
          ),
        ],
      ),
    );
  }
}
