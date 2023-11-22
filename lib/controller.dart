import 'package:document_management_web/models/leadform_model.dart';
import 'package:document_management_web/models/user_model.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import 'models/groups_model.dart';
import 'models/question_model.dart';
import 'models/template_model.dart';

class MyGeneralController extends GetxController {
  late QuillEditorController _instructionController;
  final _users = <UserModel>[].obs;
  final _groups = <GroupModel>[].obs;
  final _documents = <MyDocumentModel>[].obs;

  final _questions = <MyQuestionModel>[].obs;
  final _selectedUsers = <UserModel>[].obs;
  final _templates = <MyTemplateModel>[].obs;
  final List<MyLeadFormModel> _leadForms = [];
  //final _leadForm = <MyLeadFormModel>[].obs;


  QuillEditorController get instructionController => _instructionController;
  List<UserModel> get users => _users;
  List<GroupModel> get groups => _groups;
  List<MyDocumentModel> get documents => _documents;
  List<MyTemplateModel> get templates => _templates;

  List<MyQuestionModel> get questions1 => _questions;
  List<UserModel> get selectedUsers => _selectedUsers;
  List<MyLeadFormModel> get leadForms => _leadForms;

  void setQuillController() =>
      _instructionController = QuillEditorController();


  void addUser(UserModel model) => _users.add(model);
  void deleteUser(int index) => _users.removeAt(index);

  void addGroup(GroupModel model) => _groups.add(model);
  void deleteGroup(int index) => _groups.removeAt(index);

  void addDocument(MyDocumentModel model) => _documents.add(model);
  void deleteDocument(int index) => _documents.removeAt(index);

  void addQuestion1(MyQuestionModel model) => _questions.add(model);
  void deleteQuestion1(int index) => _questions.removeAt(index);

  void setSelectedQuestions(List<UserModel> list) =>
      _selectedUsers.value = list;

  void addTemplate(MyTemplateModel model) => _templates.add(model);
  void deleteTemplate(int index) => _templates.removeAt(index);


  void addLeadForm() =>
      _leadForms.add(MyLeadFormModel(
          instructionController: _instructionController,
          users: _selectedUsers,
          documents: _documents,
          questions: _questions,
          dueDate: DateTime.now(),
          reminders: [DateTime.now(), DateTime.now()]));

  String _removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

}
