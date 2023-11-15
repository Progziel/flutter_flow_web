class Question {
  String text;
  String answerType;
  List<String> answerOptions;

  Question({
    required this.text,
    required this.answerType,
    this.answerOptions = const [],
  });
}
