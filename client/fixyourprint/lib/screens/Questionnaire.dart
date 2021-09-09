import 'package:fixyourprint/constants.dart';
import 'package:fixyourprint/models/QuestionModel.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  var questionsList = <QuestionModel>[];

  @override
  void initState() {
    super.initState();
    questionsList = Questions().getQuestions();
    print(questionsList[0].carbonDataService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
