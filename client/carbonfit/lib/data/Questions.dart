import 'package:fixyourprint/models/QuestionModel.dart';

class Questions {
  List<QuestionModel> getQuestions() {
    var questionsList = <QuestionModel>[];
    int numberofPeople = 0;
    double transportVal = 0;
    double busVal = 0;
    double flightVal = 0;
    double trainVal = 0;
    double lpgVal = 0;
    double electricityVal = 0;
    double wasteVal = 0;
    String foodVal = '';

    var ques1 = QuestionModel(
        question: "How many people are there in your family?",
        parameter: 'numberofPeople',
        variable: numberofPeople,
        lottieUrl: 'assets/questions/family.json',
        min: 0,
        max: 10,
        divisions: 10);
    questionsList.add(ques1);

    var ques2 = QuestionModel(
        question:
            "Do you use private vehicle as a mode of your transport?\nIf yes, how much litre of fuel do you consume in a week?",
        parameter: 'transport',
        variable: transportVal,
        lottieUrl: 'assets/questions/car.json',
        min: 0,
        max: 100,
        divisions: 50);
    questionsList.add(ques2);

    var ques3 = QuestionModel(
        question:
            "Do you travel by Bus?\nIf yes, how much approximate distance in km do you travel by a Bus in a week?",
        parameter: 'bus',
        variable: busVal,
        lottieUrl: 'assets/questions/bus.json',
        min: 0,
        max: 2000,
        divisions: 100);
    questionsList.add(ques3);

    var ques4 = QuestionModel(
        question:
            "Do you take Flights?\nIf yes, how much approximate distance in km is travelled in total?",
        parameter: 'flight',
        variable: flightVal,
        lottieUrl: 'assets/questions/flight.json',
        min: 0,
        max: 5000,
        divisions: 10);
    questionsList.add(ques4);

    var ques5 = QuestionModel(
        question:
            "Do you travel by Train?\nIf yes, how much approximate distance in km do you travel by a Train in a week?",
        parameter: 'train',
        variable: trainVal,
        lottieUrl: 'assets/questions/train.json',
        min: 0,
        max: 2000,
        divisions: 50);
    questionsList.add(ques5);

    var ques6 = QuestionModel(
        question: "How many kg of lpg do you use in a month?",
        parameter: 'lpg',
        variable: lpgVal,
        lottieUrl: 'assets/questions/lpg.json',
        min: 0,
        max: 100,
        divisions: 100);
    questionsList.add(ques6);

    var ques7 = QuestionModel(
        question:
            "What is your average electricity consumption in kWh in a month?",
        parameter: 'electricity',
        variable: electricityVal,
        lottieUrl: 'assets/questions/electricity.json',
        min: 0,
        max: 500,
        divisions: 100);
    questionsList.add(ques7);

    var ques8 = QuestionModel(
        question:
            "What is the approximate household waste produced daily in kg?",
        parameter: 'waste',
        variable: wasteVal,
        lottieUrl: 'assets/questions/waste.json',
        min: 0,
        max: 50,
        divisions: 25);
    questionsList.add(ques8);

    var ques9 = QuestionModel(
        question: "Which of the following represents your eating habits?",
        parameter: 'food',
        variable: foodVal,
        lottieUrl: 'assets/questions/food.json',
        min: 0,
        max: 0,
        divisions: 0);
    questionsList.add(ques9);

    return questionsList;
  }
}
