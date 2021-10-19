import 'package:fixyourprint/services/GlobalWarmingService.dart';
import 'package:fixyourprint/widgets/ImageCarousel.dart';
import 'package:flutter/material.dart';

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
    await GlobalWarmingService().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Carbon Data',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              ImageCarousel(),
              SizedBox(
                height: 5,
              ),
              Text(
                'The following graph shows the Carbon Dioxide levels from 2010 to present:',
                style: TextStyle(fontFamily: 'Lato', fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
