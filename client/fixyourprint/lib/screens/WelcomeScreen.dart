import 'package:fixyourprint/services/AuthService.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  final String token;
  WelcomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  logoutUser() async {
    setState(() {
      _isLoading = true;
    });
    AuthService().logoutUser().then((value) {
      if (value == '') {
        _isLoading = false;
        Navigator.pop(context);
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
                  Text('WelcomeScreen and token is ' + widget.token),
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
