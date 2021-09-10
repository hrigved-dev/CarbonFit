import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/TopProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FoodQuestion extends StatefulWidget {
  const FoodQuestion({Key? key}) : super(key: key);

  @override
  _FoodQuestionState createState() => _FoodQuestionState();
}

class _FoodQuestionState extends State<FoodQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 220, top: 50),
              child: Text(
                'One Last Thing...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TopProgressBar(widthval: 300),
            SizedBox(
              height: 5,
            ),
            Text(
              '7/7',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 70,
            ),
            Text("Food Habit",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 30,
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: 150,
              child: Lottie.network(
                  'https://assets6.lottiefiles.com/private_files/lf30_jxtfcl5y.json'),
            ),
            CustomButton(
              text: 'DONE',
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
