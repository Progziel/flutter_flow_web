enum QuestionType {textField, richTextField, checkBox, radioButton}
class Question {
  String text;
  QuestionType questionType;
  List<String>? answerOptions;

  Question({
    required this.text,
    required this.questionType,
    this.answerOptions,
  });
}
