import 'package:fixyourprint/models/OffsetDataModel.dart';
import 'package:fixyourprint/services/OffsetData.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:flutter/material.dart';

class Alternatives extends StatefulWidget {
  const Alternatives({Key? key}) : super(key: key);

  @override
  _AlternativesState createState() => _AlternativesState();
}

class _AlternativesState extends State<Alternatives> {
  List<OffsetDataModel> offsetData = [];
  OffsetData offsetDataService = OffsetData();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getOffsetData();
  }

  getOffsetData() async {
    await offsetDataService.getData();
    offsetData = offsetDataService.offsetDataList;
    setState(() {
      _isLoading = false;
    });
    print(offsetData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? GreenLoader() : Center(child: Text('Alternatives')),
    );
  }
}
