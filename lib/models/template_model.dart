import 'package:document_management_web/models/reminder_model.dart';

class MyTemplateModel {
  String? name, description;
  String instruction;

  final DateTime? createdAt;
  final List<MyDocumentModel> documents;
  final List<MyQuestionModel> questions;

  MyTemplateModel({
    this.name,
    this.description,
    this.createdAt,
    required this.documents,
    required this.questions,
    required this.instruction
  });
}

class MyDocumentModel {
  MyDocumentModel({required this.name, required this.fileType});
  final String name, fileType;
}

class MyQuestionModel {
  MyQuestionModel({
    required this.question,
    required this.type,
    this.choices,
  });
  final String question, type;
  List<String>? choices;
}

class DueDateAndRemindersModel {
  final DateTime? dueDate;
  final List<Reminder> reminders;

  DueDateAndRemindersModel({required this.dueDate, required this.reminders});
}
