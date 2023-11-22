import 'package:document_management_web/controller.dart';
import 'package:document_management_web/models/groups_model.dart';
import 'package:document_management_web/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_widget.dart';
import '../../../widgets/custom_texxtfield.dart';
import '../../compose/components/users_table.dart';

MyGeneralController controller = Get.find<MyGeneralController>();
Container totalGroups(BuildContext context) {
  return Container(
    color: AppAssets.backgroundColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: 'Groups',
                fSize: 22.0,
                fWeight: FontWeight.w700,
              ),
              CustomButtonWidget(
                buttonText: 'Add Group',
                onTap: () {
                  _addUserDialog(context);
                },
              )
            ],
          ),
          Expanded(
            child: Container(
              //height: 400,
              color: Colors.white30,
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.groups.length,
                    itemBuilder: (context, index) {
                      final GroupModel group = controller.groups[index];
                      return Column(
                        children: [
                          Card(
                            child: ExpansionTile(
                              leading: const Icon(Icons.person_2_rounded),
                              collapsedBackgroundColor: Colors.grey.shade200,
                              backgroundColor: Colors.white,
                              title: CustomTextWidget(
                                text: group.name,
                                fSize: 16.0,
                                fWeight: FontWeight.w700,
                              ),
                              subtitle: CustomTextWidget(
                                  text: group.groupUsers.length.toString()),
                              children: [
                                Align(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomButtonWidget(
                                        buttonText: 'Edit',
                                        onTap: () {},
                                      ),
                                      CustomButtonWidget(
                                        buttonText: 'Delete',
                                        buttonColor: Colors.red,
                                        onTap: () =>
                                            controller.deleteUser(index),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}

void _addUserDialog(BuildContext context) {
  late List<UserModel> selectedUser;
  late TextEditingController editingController;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      selectedUser = [];
      editingController = TextEditingController();
      return AlertDialog(
        title: Center(
          child: CustomTextWidget(
            text: 'Group Registration',
            fSize: 18.0,
            fWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          children: [
            CustomTextField(
              hintText: 'Group Name',
              fillColor: Colors.white,
              controller: editingController,
            ),
            UserTable(
              users: controller.users,
              onSelected: (List<UserModel> list) {
                selectedUser = list;
              },
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                buttonText: 'Cancel',
                buttonColor: Colors.red,
                onTap: () {},
              ),
              CustomButtonWidget(
                buttonText: 'Add Group',
                onTap: () {
                  controller.addGroup(GroupModel(
                      name: editingController.text.trim(),
                      groupUsers: selectedUser));
                  Get.back();
                  // generalController.addUser(UserModel(
                  //   name: nameController.text,
                  //   email: emailController.text,
                  //   number: numberController.text.toString(),
                  // ));
                  // Get.back();
                },
              ),
            ],
          )
        ],
      );
    },
  );
}
