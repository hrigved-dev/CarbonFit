import 'package:fixyourprint/models/OffsetDataModel.dart';
import 'package:fixyourprint/services/OffsetData.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:fixyourprint/widgets/OffsetItem.dart';
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
                  'Offset your Footprint',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Donate to some of the projects",
                  style: TextStyle(fontSize: 18, fontFamily: 'Lato'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 570,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: offsetData.length,
                      itemBuilder: (context, int i) {
                        var data = offsetData[i];
                        return OffsetItem(
                            Name: data.Name,
                            Availability: data.Availability,
                            Brief: data.Brief,
                            Id: data.Id,
                            Image: data.Image,
                            Link: data.Link,
                            Min: data.Min);
                      }),
                ),
              ],
            ),
    );
  }
}
