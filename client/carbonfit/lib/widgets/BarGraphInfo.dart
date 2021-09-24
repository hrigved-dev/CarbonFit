import 'package:flutter/material.dart';

class BarGraphInfo extends StatelessWidget {
  final Color color;
  final String barinfo;
  BarGraphInfo({Key? key, required this.color, required this.barinfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                color: color,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                barinfo,
                style: TextStyle(fontFamily: 'Lato'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
