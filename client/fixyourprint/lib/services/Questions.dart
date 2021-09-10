import 'package:fixyourprint/models/QuestionModel.dart';

class Questions {
  List<QuestionModel> getQuestions() {
    var questionsList = <QuestionModel>[];

    var ques1 = QuestionModel(
        question:
            "Do you use private vehicle as a mode of your transport? If yes, how much distance do you travel in a week?",
        parameter: 'transport',
        lottieUrl:
            'https://assets6.lottiefiles.com/packages/lf20_rddfnr10.json');
    questionsList.add(ques1);

    var ques2 = QuestionModel(
        question:
            "Do you travel by Bus? If yes, how much approximate distance do you travel by a Bus in a week?",
        parameter: 'bus',
        lottieUrl:
            'https://assets10.lottiefiles.com/packages/lf20_cvcwsr0y.json');
    questionsList.add(ques2);

    var ques3 = QuestionModel(
        question:
            "Do you take Flights? If yes, how much approximate distance is travelled by the flight?",
        parameter: 'flight',
        lottieUrl: 'https://assets7.lottiefiles.com/packages/lf20_av00Bq.json');
    questionsList.add(ques3);

    var ques4 = QuestionModel(
        question:
            "Do you travel by Train? If yes, how much approximate distance do you travel by a Train in a week?",
        parameter: 'train',
        lottieUrl:
            'https://assets10.lottiefiles.com/packages/lf20_zizREI.json');
    questionsList.add(ques4);

    var ques5 = QuestionModel(
        question: "What is your LPG use?",
        parameter: 'lpg',
        lottieUrl:
            'https://assets7.lottiefiles.com/packages/lf20_buohazi6.json');
    questionsList.add(ques5);

    var ques6 = QuestionModel(
        question: "What is your average electricity consumption in a month?",
        parameter: 'electricity',
        lottieUrl:
            'https://assets6.lottiefiles.com/private_files/lf30_guzx9nfr.json');
    questionsList.add(ques6);

    var ques7 = QuestionModel(
        question: "How much waste do you produce?",
        parameter: 'waste',
        lottieUrl:
            'https://assets7.lottiefiles.com/packages/lf20_ruf6eejr.json');
    questionsList.add(ques7);

    var ques8 = QuestionModel(
        question: "Which of the following represents your eating habits?",
        parameter: 'food',
        lottieUrl:
            'https://assets6.lottiefiles.com/private_files/lf30_jxtfcl5y.json');
    questionsList.add(ques8);

    return questionsList;
  }
}
