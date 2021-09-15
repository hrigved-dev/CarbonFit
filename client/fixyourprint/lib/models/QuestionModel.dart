class QuestionModel {
  late String question;
  late String parameter;
  late var variable;
  late String lottieUrl;
  late double min;
  late double max;
  late int divisions;

  QuestionModel(
      {required this.question,
      required this.parameter,
      required this.variable,
      required this.lottieUrl,
      required this.min,
      required this.max,
      required this.divisions});
}
