import 'package:document_management_web/controller.dart';
import 'package:document_management_web/models/user_model.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTable extends StatefulWidget {
  const UserTable({Key? key, required this.users, required this.onSelected}) : super(key: key);
  final List<UserModel> users;
  final Function onSelected;
  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  late List<UserModel> selectedUsers = [];
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: SingleChildScrollView(
        child: DataTable(
          columns: [
            const DataColumn(
              label: Text(
                'S.No',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const DataColumn(
              label: Text(
                'Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Checkbox(
                activeColor: AppAssets.primaryColor,
                value: selectAll,
                onChanged: (value) {
                  setState(() {
                    selectAll = value!;
                    selectedUsers.clear();
                    if (value) {
                      for (int i = 0; i < widget.users.length; i++) {
                        selectedUsers.add(widget.users[i]);
                      }
                    }
                    widget.onSelected(selectedUsers);
                  });
                },
              ),
            ),
          ],
          rows: [
            for (int index = 0; index < widget.users.length; index++)
              DataRow(
                mouseCursor: MaterialStateMouseCursor.clickable,
                color: MaterialStateColor.resolveWith((states) {
                  return index % 2 == 0
                      ? Colors.white
                      : Colors.grey.shade200; // Alternate row colors
                }),
                cells: [
                  DataCell(
                    Text((index + 1).toString()),
                  ), // S.No column

                  DataCell(Text(widget.users[index].name)),
                  DataCell(Text(widget.users[index].email)),
                  DataCell(Text(widget.users[index].number)),
                  DataCell(
                    Checkbox(
                      activeColor: AppAssets.primaryColor,
                      value: selectedUsers.contains(widget.users[index]),
                      onChanged: (value) {
                        setState(() {
                          (value != null && !value)
                              ? selectedUsers.removeAt(index)
                              : selectedUsers.add(widget.users[index]);
                        });
                        widget.onSelected(selectedUsers);
                      },
                    ),
                  ),
                  // DataCell(
                  //   GestureDetector(
                  //     onTap: () {
                  //       Get.to(const StepperWidget(),
                  //           transition: Transition.rightToLeft);
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //         color: AppAssets.primaryColor,
                  //         border: Border.all(color: AppAssets.backgroundColor),
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //       child: const Text(
                  //         'Send Request',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
