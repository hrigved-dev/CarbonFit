import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String username='';
  String email='';
  String password='';
  String confirmpassword='';
  bool _obscureText=true;
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isloading
        ? Center(
          child: Container(
            height: 100,
            width: 100,
            child: Center(
              child:CircularProgressIndicator(color: Colors.green,
              ),
              ),
              ),
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    child:Image.asset('assets/register/leafv3.png', fit: BoxFit.contain,
                    ),
                    ),
                  )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ,
            )
          ],
        )

    );
  }
}