import 'dart:async';
import 'package:fixyourprint/screens/LoginScreen.dart';
import 'package:fixyourprint/screens/WelcomeScreen.dart';
import 'package:fixyourprint/services/AuthService.dart';
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
  String token = '';
  bool _alreadySigned = false;

  userSignedIn() {
    AuthService().getToken().then((value) {
      token = value;
      if (token != '') {
        setState(() {
          _alreadySigned = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _alreadySigned = false;
    userSignedIn();
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
                    _alreadySigned
                        ? Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: WelcomeScreen(),
                                type: PageTransitionType.fade))
                        : Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: LoginScreen(),
                                type: PageTransitionType.fade));
                  },
                  child: AnimatedTap(
                      text: 'Tap to Start',
                      textStyle: TextStyle(fontSize: 18, color: Colors.white),
                      opacity: _opacity)),
            ],
          ),
        ],
      ),
    );
  }
}
