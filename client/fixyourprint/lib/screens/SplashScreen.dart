import 'dart:async';
import 'package:fixyourprint/screens/LoginScreen.dart';
import 'package:fixyourprint/widgets/AnimatedTap.dart';
import 'package:fixyourprint/widgets/BackgroundVideo.dart';
import 'package:fixyourprint/widgets/SplashTitle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => {
              setState(() => {_opacity = 1})
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundVideo(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 210),
                child: SplashTitle(title: "FixYourPrint"),
              ),
              SizedBox(
                height: 200,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: LoginScreen(),
                            type: PageTransitionType.fade));
                  },
                  child: AnimatedTap(opacity: _opacity)),
            ],
          ),
        ],
      ),
    );
  }
}
