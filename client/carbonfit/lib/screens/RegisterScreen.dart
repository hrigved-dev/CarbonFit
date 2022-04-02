import 'package:fixyourprint/screens/LoginScreen.dart';
import 'package:fixyourprint/screens/Questionnaire.dart';
import 'package:fixyourprint/widgets/BottomText.dart';
import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/FormField.dart';
import 'package:fixyourprint/widgets/GreenLoader.dart';
import 'package:flutter/material.dart';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  bool _obscureText = true;
  String token = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  createUser() {
    setState(() {
      _isLoading = true;
    });
    AuthService().createUser(name, email, password).then((value) {
      token = value;
      print(token);
      if (token != '') {
        _isLoading = false;
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: Questionnaire(
                  isUpdate: false,
                ),
                type: PageTransitionType.fade));
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 70),
                        child: Container(
                            width: 300,
                            child: Image.asset(
                              'assets/register/leafv3.png',
                              fit: BoxFit.contain,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
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
                            "Register to Continue.",
                            style: TextStyle(fontSize: 22, fontFamily: 'Lato'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FormFieldWidget(
                            labelText: 'Name',
                            onChanged: (value) {
                              name = value;
                            },
                            obscureText: false,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FormFieldWidget(
                              labelText: 'Email',
                              onChanged: (value) {
                                email = value;
                              },
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress),
                          SizedBox(
                            height: 20,
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FormFieldWidget(
                            labelText: 'Re-enter password',
                            onChanged: (value) {
                              confirmpassword = value;
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
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            text: "REGISTER",
                            onPressed: () {
                              if (password == confirmpassword) {
                                createUser();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Passwords do not match')));
                              }
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          BottomText(
                              text: 'Already a User?',
                              tapText: 'Sign In Here',
                              screen: LoginScreen())
                        ]),
                  ),
                ],
              ));
  }
}
