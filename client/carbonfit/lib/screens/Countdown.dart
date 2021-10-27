import 'dart:async';
import 'package:flutter/material.dart';
import 'package:date_count_down/countdown.dart';
import 'package:lottie/lottie.dart';

class Countdown extends StatefulWidget {
  const Countdown({Key? key}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  String countTime = 'Loading';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    countTime = CountDown().timeLeft(DateTime.parse("2029-07-22"), "Completed");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "We must achieve Zero Emissions in:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                    fontSize: 25),
              ),
            ),
            Stack(children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(width: 5),
                  color: Color(0xffD7FFD8),
                  shape: BoxShape.circle,
                ),
                child: LottieBuilder.network(
                  'https://assets5.lottiefiles.com/private_files/lf30_nivslwok.json',
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade600, width: 5),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 80),
                    child: Text(
                      countTime,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ]),
            Text(
              "One Deadline",
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We must take action to reduce global greenhouse gas emissions toward zero as quickly as possible within this critical time window for action.",
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
