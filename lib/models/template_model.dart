import 'package:document_management_web/models/reminder_model.dart';

class MyTemplateModel {
  MyTemplateModel({
    this.name,
    this.description,
    this.dueDateAndReminders,
    required this.documents,
    required this.questions, required this.instruction,required this.createdAt
  });

  String? name, description;
  final DueDateAndRemindersModel? dueDateAndReminders;
  final List<MyDocumentModel> documents;
  final List<MyQuestionModel> questions;
final String instruction;
final DateTime createdAt;
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
