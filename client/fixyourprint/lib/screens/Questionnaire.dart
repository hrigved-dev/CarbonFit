import 'package:fixyourprint/models/QuestionModel.dart';
import 'package:fixyourprint/screens/Dashboard.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:fixyourprint/services/Questions.dart';
import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/FoodButtons.dart';
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
  bool _showSlider = true;
  String foodVal = '';

  @override
  void initState() {
    super.initState();
    _showSlider = true;
    questionsList = Questions().getQuestions();
    topText = "Let's Start...";
  }

  getNextQuestion() {
    if (index == 6) {
      index = 7;
      widthVal = widthVal + 42.857142;

      _showSlider = false;
    } else if (index > 6) {
      return;
    } else {
      index++;
      topText = 'One More...';
      widthVal = widthVal + 42.857142;
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
                _showSlider ? topText : 'One Last Thing...',
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
              (index + 1).toString() + '/8',
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
            _showSlider
                ? Slider(
                    min: 0,
                    max: 5000,
                    divisions: 25,
                    value: sliderVal,
                    label: sliderVal.round().toString(),
                    onChanged: (value) => setState(() => sliderVal = value))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          FoodButton(label: 'Average Meat'),
                          SizedBox(
                            height: 20,
                          ),
                          FoodButton(label: 'Meat Lover'),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          FoodButton(
                            label: 'No Red Meat',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FoodButton(
                            label: 'Vegetarian',
                          ),
                        ],
                      ),
                    ],
                  ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              text: _showSlider ? 'NEXT' : 'FINISH',
              onPressed: () {
                setState(() {
                  if (!_showSlider) {
                    print(foodVal);
                    // CarbonDataService().foodEmission("Meat Lover");
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Dashboard(),
                            type: PageTransitionType.leftToRight));
                  }
                  getNextQuestion();
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
