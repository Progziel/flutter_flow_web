import 'package:document_management_web/models/template_model.dart';

class MyLeadFormModel {


  String? name, description;
  final DateTime? createdAt;
  final List<MyDocumentModel> documents;
  final List<MyQuestionModel> questions;

  MyLeadFormModel({
    this.name,
    this.description,
    this.createdAt,
    required this.documents,
    required this.questions,
  });
}