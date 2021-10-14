import 'package:fixyourprint/models/QuestionModel.dart';
import 'package:fixyourprint/screens/Home.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:fixyourprint/data/Questions.dart';
import 'package:fixyourprint/widgets/CustomButton.dart';
import 'package:fixyourprint/widgets/CustomDropdown.dart';
import 'package:fixyourprint/widgets/LottieFile.dart';
import 'package:fixyourprint/widgets/TopProgressBar.dart';
import 'package:fixyourprint/widgets/ValueSlider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Questionnaire extends StatefulWidget {
  final bool isUpdate;
  Questionnaire({Key? key, required this.isUpdate}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  var questionsList = <QuestionModel>[];
  static final List<String> foodHabitChoices = <String>[
    "Non-Vegetarian",
    "Vegetarian",
    "Vegan",
  ];
  String? foodVal = foodHabitChoices.first;
  double output = 0;
  String question = '';
  String topText = '';
  int index = 0;
  double sliderVal = 0;
  double widthVal = 0;
  double inputVal = 0;
  bool _showSlider = true;

  @override
  void initState() {
    super.initState();
    _showSlider = true;
    questionsList = Questions().getQuestions();
    topText = "Let's Start...";
    print(widget.isUpdate);
  }

  getNextQuestion() {
    if (index == 7) {
      index = 8;
      widthVal = widthVal + 37.5;
      _showSlider = false;
    } else if (index > 7) {
      return;
    } else {
      index++;
      topText = 'One More...';
      widthVal = widthVal + 37.5;
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
                style: TextStyle(
                    fontFamily: 'Lato', color: Colors.black, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TopProgressBar(
              widthval: widthVal,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              (index + 1).toString() + '/9',
              style: TextStyle(fontFamily: 'Lato', fontSize: 18),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              questionsList[index].question,
              style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LottieFile(url: questionsList[index].lottieUrl),
            _showSlider
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(questionsList[index].min.toStringAsFixed(0),
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          Text(
                              questionsList[index].max.toStringAsFixed(0) + "+",
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      ValueSlider(
                          min: questionsList[index].min,
                          sliderVal: sliderVal,
                          max: questionsList[index].max,
                          divisions: questionsList[index].divisions,
                          onChanged: (value) => setState(() {
                                sliderVal = value;
                                questionsList[index].variable = sliderVal;
                              })),
                    ],
                  )
                : Center(
                    child: CustomDropDown(
                      foodVal: foodVal,
                      foodHabitChoices: foodHabitChoices,
                      onChanged: (foodVal) => setState(() {
                        this.foodVal = foodVal;
                      }),
                    ),
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
                    widget.isUpdate
                        ? CarbonDataService().updateEmission(
                            questionsList[0].variable,
                            questionsList[1].variable,
                            questionsList[2].variable,
                            questionsList[3].variable,
                            questionsList[4].variable,
                            questionsList[5].variable,
                            questionsList[6].variable,
                            questionsList[7].variable,
                            questionsList[8].variable,
                          )
                        : CarbonDataService().emissionCalculation(
                            questionsList[0].variable,
                            questionsList[1].variable,
                            questionsList[2].variable,
                            questionsList[3].variable,
                            questionsList[4].variable,
                            questionsList[5].variable,
                            questionsList[6].variable,
                            questionsList[7].variable,
                            questionsList[8].variable,
                          );
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Home(),
                            type: PageTransitionType.leftToRight));
                  } else {
                    print(questionsList[index].parameter +
                        ":" +
                        sliderVal.toString() +
                        ":" +
                        questionsList[index].variable.toString());
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
