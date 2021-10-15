import 'package:fixyourprint/models/AlternativesDataModel.dart';
import 'package:fixyourprint/services/AlternativesData.dart';
import 'package:fixyourprint/widgets/AlternativesItem.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:flutter/material.dart';

class AlternativesScreen extends StatefulWidget {
  const AlternativesScreen({Key? key}) : super(key: key);

  @override
  _AlternativesScreenState createState() => _AlternativesScreenState();
}

class _AlternativesScreenState extends State<AlternativesScreen> {
  bool _isLoading = true;
  AlternativesDataProcess alternativesDataProcess = AlternativesDataProcess();
  List<AlternativesDataModel> alternatives = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await alternativesDataProcess.getData();
    alternatives = alternativesDataProcess.alternativesDataList;
    print(alternatives[0].Electricity);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? GreenLoader()
          : Column(
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
                  height: 550,
                  // child: ListView.builder(
                  //     itemCount: alternatives.length,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, int i) {
                  //       var data = alternatives[0];
                  //       return AlternativesItem();
                  //     }),
                ),
              ],
            ),
    );
  }
}
