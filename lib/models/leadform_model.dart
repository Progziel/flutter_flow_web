import 'package:document_management_web/models/template_model.dart';
import 'package:document_management_web/models/user_model.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class MyLeadFormModel {
  final QuillEditorController instructionController;
  final List<UserModel> users;
  final List<MyDocumentModel> documents;
  final List<MyQuestionModel> questions;
  final DateTime dueDate;
  final List<DateTime> reminders;

  MyLeadFormModel({
    required this.instructionController,
    required this.users,
    required this.documents,
    required this.questions,
    required this.dueDate,
    required this.reminders,
  });
}