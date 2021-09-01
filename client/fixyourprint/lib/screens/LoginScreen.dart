import 'package:fixyourprint/screens/RegisterScreen.dart';
import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/FormField.dart';
import 'package:fixyourprint/widgets/TapText.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Sign in to Continue.",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 80,
                ),
                FormFieldWidget(
                    labelText: 'email',
                    onChanged: (value) {
                      email = value;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 25,
                ),
                FormFieldWidget(
                  labelText: 'password',
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: _obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    print(email);
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New user?',
                      style: TextStyle(fontSize: 15),
                    ),
                    TapText(
                      tapText: ' Sign up Here!',
                      nextScreen: RegisterScreen(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
