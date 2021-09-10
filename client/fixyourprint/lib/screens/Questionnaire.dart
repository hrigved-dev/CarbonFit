import 'package:fixyourprint/models/QuestionModel.dart';
import 'package:fixyourprint/screens/FoodQues.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:fixyourprint/services/Questions.dart';
import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/TopProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  var questionsList = <QuestionModel>[];
  double output = 0;
  String question = '';
  String topText = '';
  int index = 0;
  double sliderVal = 0;
  double widthVal = 0;
  double inputVal = 0;

  @override
  void initState() {
    super.initState();
    questionsList = Questions().getQuestions();
    getNextQuestion();
    topText = "Let's Start...";
  }

  getNextQuestion() {
    index++;
    topText = 'One More...';
    widthVal = widthVal + 42.857142;
    if (index > 6) {
      Navigator.of(context).push(
          PageTransition(child: FoodQuestion(), type: PageTransitionType.fade));
    }
  }

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
                topText,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TopProgressBar(
              widthval: widthVal,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$index/7',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              questionsList[index].question,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: 150,
              child: Lottie.network(questionsList[index].lottieUrl),
            ),
            Slider(
                min: 0,
                max: 1000,
                divisions: 5,
                value: sliderVal,
                label: sliderVal.round().toString(),
                onChanged: (value) => setState(() => sliderVal = value)),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              text: 'NEXT',
              onPressed: () {
                setState(() {
                  getNextQuestion();
                  print(sliderVal);
                  CarbonDataService().emissionCalculation(
                      questionsList[index].parameter, sliderVal);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
