import 'package:document_management_web/utilities/constants.dart';
import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  const TableData({Key? key}) : super(key: key);

  @override
  _TableDataState createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  bool selectAll = false;
  List<TableRowData> rowData = [
    TableRowData(
      name: 'John Smith',
      email: 'john@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Alice Johnson',
      email: 'alice@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Bob Davis',
      email: 'bob@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Ella Clark',
      email: 'ella@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'David Wilson',
      email: 'david@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Olivia Miller',
      email: 'olivia@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Liam Brown',
      email: 'liam@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Sophia Harris',
      email: 'sophia@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Michael White',
      email: 'michael@gmail.com',
      number: '123456789',
      selected: false,
    ),
    TableRowData(
      name: 'Ava Jones',
      email: 'ava@gmail.com',
      number: '123456789',
      selected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                    for (var data in rowData) {
                      data.selected = value;
                    }
                  });
                },
              ),
            ),
          ],
          rows: [
            for (int index = 0; index < rowData.length; index++)
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

                  DataCell(Text(rowData[index].name)),
                  DataCell(Text(rowData[index].email)),
                  DataCell(Text(rowData[index].number)),
                  DataCell(
                    Checkbox(
                      activeColor: AppAssets.primaryColor,
                      value: rowData[index].selected,
                      onChanged: (value) {
                        setState(() {
                          rowData[index].selected = value!;
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

class TableRowData {
  final String name;

  final String email;
  final String number;
  bool selected;

  TableRowData({
    required this.name,
    required this.email,
    required this.number,
    this.selected = false,
  });
}
