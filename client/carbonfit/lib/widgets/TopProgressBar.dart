import 'package:flutter/material.dart';

class TopProgressBar extends StatefulWidget {
  final double widthval;
  TopProgressBar({Key? key, required this.widthval}) : super(key: key);

  @override
  _TopProgressBarState createState() => _TopProgressBarState();
}

class _TopProgressBarState extends State<TopProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightGreen[200],
      ),
      child: Row(
        children: [
          Container(
            height: 25,
            width: widget.widthval,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.green),
          )
        ],
      ),
    );
  }
}
