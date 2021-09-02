import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/FormField.dart';
import 'package:flutter/material.dart';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:page_transition/page_transition.dart';

import 'WelcomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name='';
  String email='';
  String password='';
  String confirmpassword='';
  bool _obscureText = true;
  String token = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  registerUser() {
    setState(() {
      _isLoading = true;
    });
    AuthService().createUser(name ,email, password).then((value) {
      token = value;
      print(token);
      if (token != '') {
        _isLoading = false;
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: WelcomeScreen(token: token),
                type: PageTransitionType.fade));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLoading
          ? Center(
            child: Container(
              height: 100,
              width: 100,
              child:Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                  ),
              ),
              ),
          )
          :Column(
            crossAxisAlignment:  CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Padding(padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        
                        width: 300,
                        child: Image.asset('assets/register/leafv3.png', fit: BoxFit.contain,
                        )),
                    ],
                  ),
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
                            fontSize: 28, fontWeight: FontWeight.bold),
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
                      FormFieldWidget(labelText: 'name', onChanged: (value){
                        name = value;
                      },
                      obscureText: false,
                      keyboardType: TextInputType.name,
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
                        suffixIcon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                        FormFieldWidget(
                        labelText: 'confirmpassword',
                        onChanged: (value) {
                          confirmpassword = value;
                        },
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(onPressed: () {
                        registerUser();
                      },),
                    
                    ]
                    ),
              ),
              ],
          )
    );
  }
}