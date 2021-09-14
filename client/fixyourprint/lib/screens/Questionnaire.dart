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

  getLabel(int num) {
    print(num);
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
              height: 60,
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
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(questionsList[index].min.toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          Text(questionsList[index].max.toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            trackHeight: 16,
                            thumbColor: Colors.green[900],
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12),
                            valueIndicatorColor: Colors.green[300],
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.green[900]),
                        child: Slider(
                            min: questionsList[index].min,
                            max: questionsList[index].max,
                            divisions: questionsList[index].divisions,
                            value: sliderVal,
                            label: sliderVal.round().toString(),
                            onChanged: (value) => setState(() {
                                  sliderVal = value;
                                })),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          FoodButton(
                            label: 'Average Meat',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FoodButton(
                            label: 'Meat Lover',
                          ),
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
              height: 40,
            ),
            CustomButton(
              text: _showSlider ? 'NEXT' : 'FINISH',
              onPressed: () {
                setState(() {
                  if (!_showSlider) {
                    print(foodVal);
                    CarbonDataService().foodEmission(foodVal);
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Dashboard(),
                            type: PageTransitionType.leftToRight));
                  } else {
                    print(questionsList[index].parameter +
                        ":" +
                        sliderVal.toString());
                    CarbonDataService().emissionCalculation(
                        questionsList[index].parameter, sliderVal);
                    sliderVal = 0;

                    getNextQuestion();
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
