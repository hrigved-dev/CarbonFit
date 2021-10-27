import 'package:fixyourprint/models/OffsetDataModel.dart';
import 'package:fixyourprint/services/OffsetData.dart';
import 'package:fixyourprint/widgets/OffsetItem.dart';
import 'package:fixyourprint/widgets/ShimmerWidget.dart';
import 'package:flutter/material.dart';

class OffsetScreen extends StatefulWidget {
  const OffsetScreen({Key? key}) : super(key: key);

  @override
  _OffsetScreenState createState() => _OffsetScreenState();
}

class _OffsetScreenState extends State<OffsetScreen> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Offset your Footprint',
            style: TextStyle(
                fontSize: 22, fontFamily: 'Lato', fontWeight: FontWeight.bold),
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
            height: 550,
            child: Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _isLoading ? 7 : offsetData.length,
                  itemBuilder: (context, int i) {
                    return _isLoading
                        ? buildOffsetShimmer()
                        : OffsetItem(
                            Name: offsetData[i].Name,
                            Availability: offsetData[i].Availability,
                            Brief: offsetData[i].Brief,
                            Id: offsetData[i].Id,
                            Image: offsetData[i].Image,
                            Link: offsetData[i].Link,
                            Min: offsetData[i].Min);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOffsetShimmer() => Column(
        children: [
          ListTile(
            leading: ShimmerWidget.circular(
              width: 64,
              height: 64,
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            title: ShimmerWidget.rectangular(height: 16),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
}
