import 'package:fixyourprint/screens/LoginScreen.dart';
import 'package:fixyourprint/screens/SplashScreen.dart';
import 'package:fixyourprint/services/AuthService.dart';
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
      body: _isLoading
          ? GreenLoader()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('WelcomeScreen and token is ' + token),
                  MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        logoutUser();
                      })
                ],
              ),
            ),
    );
  }
}
