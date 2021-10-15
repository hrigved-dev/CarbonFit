import 'package:fixyourprint/widgets/ImageView.dart';
import 'package:flutter/material.dart';

class AlternativesOverview extends StatelessWidget {
  final String data;
  final String parameter;
  final String imgUrl;
  const AlternativesOverview(
      {Key? key,
      required this.data,
      required this.imgUrl,
      required this.parameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: ImageView(Image: imgUrl, Id: parameter),
            ),
            Text(
              parameter,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 22,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Here Are Some of The Solutions for reducing your $parameter Footprint",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              data,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
