import 'package:fixyourprint/models/QuestionModel.dart';
import 'package:fixyourprint/services/CarbonDataService.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Colors.green;
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Colors.white;

class Questions {
  List<QuestionModel> getQuestions() {
    var questionsList = <QuestionModel>[];
    CarbonDataService carbonDataService = CarbonDataService();

    var ques1 = QuestionModel(
        question:
            "Do you use private vehicle as a mode of your transport? If yes, how much distance do you travel by the private vehicle in a week?",
        carbonDataService: carbonDataService);
    questionsList.add(ques1);

    var ques2 = QuestionModel(
        question:
            "Do you travel by Bus? If yes, how much approximate distance do you travel by a Bus in a week?",
        carbonDataService: carbonDataService);
    questionsList.add(ques2);

    var ques3 = QuestionModel(
        question:
            "Do you take Flights? If yes, how much approximate distance is travelled by the flight?",
        carbonDataService: carbonDataService);
    questionsList.add(ques3);

    var ques4 = QuestionModel(
        question:
            "Do you travel by Train? If yes, how much approximate distance do you travel by a Train in a week?",
        carbonDataService: carbonDataService);
    questionsList.add(ques4);

    var ques5 = QuestionModel(
        question: "LPG Use", carbonDataService: carbonDataService);
    questionsList.add(ques5);

    var ques6 = QuestionModel(
        question: "Electricity consumption?",
        carbonDataService: carbonDataService);
    questionsList.add(ques6);

    var ques7 = QuestionModel(
        question: "Waste use?", carbonDataService: carbonDataService);
    questionsList.add(ques7);

    return questionsList;
  }
}
