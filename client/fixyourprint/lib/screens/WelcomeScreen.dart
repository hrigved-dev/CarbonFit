import 'dart:async';
import 'dart:ui';
import 'package:fixyourprint/screens/Questionnaire.dart';
import 'package:fixyourprint/screens/SplashScreen.dart';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:fixyourprint/widgets/AnimatedButton.dart';
import 'package:fixyourprint/widgets/AnimatedTap.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatefulWidget {
  // final String token;
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isLoading = false;
  String token = '';
  double _opacity = 0;
  double _containerWidth = 0;
  double _fontSize = 0;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    AuthService().getToken().then((value) {
      token = value;
      print(token);
      setState(() {
        _isLoading = false;
      });
    });
    Timer(
        Duration(seconds: 1),
        () => {
              setState(() => {
                    _opacity = 1,
                    _containerWidth = 100,
                    _fontSize = 12,
                  }),
            });
  }

  logoutUser() async {
    setState(() {
      _isLoading = true;
    });
    AuthService().logoutUser().then((value) {
      if (value == '') {
        _isLoading = false;
        Navigator.push(
            context,
            PageTransition(
                child: SplashScreen(), type: PageTransitionType.fade));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7F8),
      body: _isLoading
          ? GreenLoader()
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      "So what are you waiting for?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("LET'S EXPLORE",
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Container(
                      height: 300,
                      width: 600,
                      child: Image.asset('assets/welcome/earth.gif')),
                  SizedBox(
                    height: 50,
                  ),
                  AnimatedTap(
                      opacity: _opacity,
                      text: "Wish to know more about Carbon Emissions?",
                      textStyle: TextStyle(color: Colors.black, fontSize: 18)),
                  AnimatedTap(
                      opacity: _opacity,
                      text: "Talk to Ember- The AI Chatbot!",
                      textStyle: TextStyle(color: Colors.black, fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                      onTap: () {
                        logoutUser();
                      },
                      fontSize: _fontSize,
                      width: _containerWidth,
                      name: "EMBER",
                      color: Colors.green),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: AnimatedOpacity(
                      duration: Duration(seconds: 5),
                      opacity: _opacity,
                      child: Divider(
                        thickness: 2,
                        color: Colors.red[700],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedTap(
                      opacity: _opacity,
                      text: "Wish to Calculate your Carbon Footprint?",
                      textStyle: TextStyle(color: Colors.black, fontSize: 18)),
                  AnimatedTap(
                      opacity: _opacity,
                      text: "Calculate it Here!",
                      textStyle: TextStyle(color: Colors.black, fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Questionnarie(),
                                type: PageTransitionType.fade));
                      },
                      fontSize: _fontSize,
                      width: _containerWidth,
                      name: "CALCULATE",
                      color: Colors.green)
                ],
              ),
            ),
    );
  }
}
