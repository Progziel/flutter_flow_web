import 'package:document_management_web/controller.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTable extends StatefulWidget {
  const UserTable({Key? key}) : super(key: key);

  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  late MyGeneralController generalController;
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
    generalController = Get.find<MyGeneralController>();
  }

  @override
  Widget build(BuildContext context) {
    var users = generalController.users;
    return Container(
      height: 100,
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
                    for (var data in users) {
                      data.selected = value;
                    }
                  });
                },
              ),
            ),
          ],
          rows: [
            for (int index = 0; index < users.length; index++)
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

                  DataCell(Text(users[index].name)),
                  DataCell(Text(users[index].email)),
                  DataCell(Text(users[index].number)),
                  DataCell(
                    Checkbox(
                      activeColor: AppAssets.primaryColor,
                      value: users[index].selected,
                      onChanged: (value) {
                        setState(() {
                          users[index].selected = value!;
                        });
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
