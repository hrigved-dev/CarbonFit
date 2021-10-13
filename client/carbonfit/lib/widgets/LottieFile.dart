import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class LottieFile extends StatefulWidget {
  String url;
  LottieFile({Key? key, required this.url}) : super(key: key);

  @override
  _LottieFileState createState() => _LottieFileState();
}

class _LottieFileState extends State<LottieFile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Lottie.network(widget.url),
    );
  }
}
