import 'package:fixyourprint/screens/Home.dart';
import 'package:fixyourprint/screens/RegisterScreen.dart';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:fixyourprint/widgets/BottomText.dart';
import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/FormField.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool _obscureText = true;
  String token = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  loginUser() {
    setState(() {
      _isLoading = true;
    });
    AuthService().loginUser(email, password).then((value) {
      token = value;
      if (token != '') {
        _isLoading = false;
        Navigator.pushReplacement(context,
            PageTransition(child: Home(), type: PageTransitionType.fade));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLoading
          ? GreenLoader()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          width: 300,
                          child: Image.asset(
                            'assets/login/leafv3.png',
                            fit: BoxFit.contain,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Sign in to Continue.",
                        style: TextStyle(fontFamily: 'Lato', fontSize: 22),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      FormFieldWidget(
                          labelText: 'Email',
                          onChanged: (value) {
                            email = value;
                          },
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: 25,
                      ),
                      FormFieldWidget(
                        labelText: 'Password',
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),

                        // suffixIcon: Icon(_obscureText
                        //     ? Icons.visibility
                        //     : Icons.visibility_off),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: 'LOGIN',
                        onPressed: () {
                          loginUser();
                        },
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      BottomText(
                          text: 'New User?',
                          tapText: 'Sign Up Here',
                          screen: RegisterScreen())
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
