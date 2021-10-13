import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  void initState() {
    super.initState();
  }

  // getProfileInfo() async {
  //   await AuthService().getProfile();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile Info')),
    );
  }
}
