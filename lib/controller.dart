import 'package:document_management_web/models/user_model.dart';
import 'package:get/get.dart';

import 'models/template_model.dart';

class MyGeneralController extends GetxController {
  final _users = <UserModel>[].obs;
  final _documents = <MyDocumentModel>[].obs;
  final _templates = <MyTemplateModel>[].obs;

  List<UserModel> get users => _users;
  List<MyDocumentModel> get documents => _documents;
  List<MyTemplateModel> get templates => _templates;

  void addUser(UserModel model) => _users.add(model);
  void deleteUser(int index) => _users.removeAt(index);

  void addDocument(MyDocumentModel model) => _documents.add(model);
  void deleteDocument(int index) => _documents.removeAt(index);

  void addTemplate(MyTemplateModel model) => _templates.add(model);
  void deleteTemplate(int index) => _templates.removeAt(index);
}
