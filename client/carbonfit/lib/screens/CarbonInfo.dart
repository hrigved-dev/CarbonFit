import 'package:fixyourprint/services/GlobalWarmingService.dart';
import 'package:fixyourprint/widgets/ImageCarousel.dart';
import 'package:fixyourprint/widgets/LineChartWidget.dart';
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
                'The following graph shows the Carbon Dioxide levels from 2011 to present:',
                style: TextStyle(fontFamily: 'Lato', fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 600,
                width: double.infinity,
                // color: Colors.amber,
                child: Card(
                    elevation: 4,
                    color: Color(0XFFF3EFCC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LineChartWidget(),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "X-Axis denotes the year",
                        style: TextStyle(fontFamily: 'Lato', fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Y-Axis denotes the Carbon in ppm(Parts Per Million)",
                          style: TextStyle(fontFamily: 'Lato', fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
