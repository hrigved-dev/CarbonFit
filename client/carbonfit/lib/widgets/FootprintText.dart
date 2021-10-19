import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:flutter/material.dart';

class FootprintText extends StatefulWidget {
  const FootprintText({Key? key}) : super(key: key);

  @override
  _FootprintTextState createState() => _FootprintTextState();
}

class _FootprintTextState extends State<FootprintText> {
  double footprint = 0.0;
  List<dynamic> responseData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    getFootprint();
  }

  getFootprint() async {
    responseData = await CarbonDataService().getEmission();
    footprint = responseData[0]['total'];
    footprint = double.parse(footprint.toStringAsFixed(2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Text('...')
        : Row(
            children: [
              Text(
                footprint.toString() + ' ',
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "tonnes CO2/year",
                style: TextStyle(fontFamily: 'Lato', fontSize: 18),
              ),
            ],
          );
  }
}
