import 'package:fixyourprint/constants.dart';
import 'package:fixyourprint/screens/RegisterScreen.dart';
import 'package:fixyourprint/widgets/Button.dart';
import 'package:fixyourprint/widgets/FormField.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

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
                TextFormField(
                  onChanged: (value) => {
                    email = value,
                  },
                  decoration: InputDecoration(
                      labelText: 'email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onChanged: (value) => {
                    password = value,
                  },
                  decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Button(
                  onPressed: () {},
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: RegisterScreen(),
                                type: PageTransitionType.leftToRight));
                      },
                      child: Text(
                        ' Sign up Here!',
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    )
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
