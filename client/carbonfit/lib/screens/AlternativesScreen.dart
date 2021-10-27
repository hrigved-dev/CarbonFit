import 'package:fixyourprint/data/AlternativesData.dart';
import 'package:fixyourprint/models/AlternativesDataModel.dart';
import 'package:fixyourprint/widgets/AlternativesItem.dart';
import 'package:flutter/material.dart';

class AlternativesScreen extends StatefulWidget {
  const AlternativesScreen({Key? key}) : super(key: key);

  @override
  _AlternativesScreenState createState() => _AlternativesScreenState();
}

class _AlternativesScreenState extends State<AlternativesScreen> {
  List<AlternativesDataModel> alternatives = [];

  @override
  void initState() {
    super.initState();
    alternatives = AlternativesData().getAlternatives();
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
          SizedBox(
            height: 10,
          ),
          Container(
            height: 520,
            child: Flexible(
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, int i) {
                    return AlternativesItem(
                      imgUrl: alternatives[i].imgUrl,
                      parameter: alternatives[i].parameter,
                      data: alternatives[i].data,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
