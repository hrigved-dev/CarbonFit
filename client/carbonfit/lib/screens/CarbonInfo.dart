import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarbonInfo extends StatefulWidget {
  const CarbonInfo({Key? key}) : super(key: key);

  @override
  _CarbonInfoState createState() => _CarbonInfoState();
}

class _CarbonInfoState extends State<CarbonInfo> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // await GlobalWarmingService().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Carbon Data',
            style: TextStyle(
                fontSize: 22, fontFamily: 'Lato', fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'For thousands of years, the natural concentration of CO2 in earth atmosphere was around 280 ppm.\nFrom the beginning of the industrial revolution, human activities like the burning of fossil fuels, deforestation, and livestock have increased this amount by more than 30%.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
              'The following graph shows the Carbon Dioxide levels from 2010 to present.'),
          Container(
              height: 100,
              width: 100,
              child: LottieBuilder.asset('assets/questions/family.json')),
        ],
      ),
    );
  }
}
