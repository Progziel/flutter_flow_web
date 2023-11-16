import 'package:document_management_web/models/reminder_model.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/reminders/components/table.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../compose/components/table.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final List<Reminder> reminders = List.generate(15, (index) {
    // Generating dynamic dates (e.g., '2023-11-15', '2023-11-16', etc.)
    String date = '${index + 1}/10/2023';
    return Reminder(date: date, email: 'james@gmail.com');
  });

  List<ReminderDataTable> rowData = [
    ReminderDataTable(
      id: "dwhj5632",
        expiry: '20/12/23',
      email: 'john@gmail.com',
      number: '123456789',
      status: "Rejected",
      count: "2"
    ),
    ReminderDataTable(
        id: "llks5632",
        expiry: '09/12/23',
      email: 'Kreyghy@gmail.com',
      number: '123456789',
      status: "Pending",
      count: "1"
    ),
    ReminderDataTable(
        id: "xWee5632",
        expiry: '11/12/23',
      email: 'Nora@gmail.com',
      number: '123456789',
      status: "Expired",
      count: "2"
    ),
    ReminderDataTable(
        id: "poaz5632",
      expiry: '20/12/23',
      email: 'Tiwari0099@gmail.com',
      number: '123456789',
      status: "Pending",
      count: "4"
    ),
    ReminderDataTable(
        id: "qwio5632",
        expiry: '20/12/23',
      email: 'john@gmail.com',
      number: '123456789',
      status: "Rejected",
      count: "2"
    ),
    ReminderDataTable(
        id: "lksa5632",
        expiry: '20/12/23',
      email: 'john@gmail.com',
      number: '123456789',
      status: "Rejected",
      count: "2"
    ),
    ReminderDataTable(
        id: "poip5631",
        expiry: '26/12/23',
      email: 'john@gmail.com',
      number: '123456789',
      status: "Rejected",
      count: "2"
    ),
    ReminderDataTable(
        id: "nkcj5632",
        expiry: '20/12/23',
      email: 'john@gmail.com',
      number: '123456789',
      status: "Rejected",
      count: "2"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppAssets.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          child: context.isLandscape
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: leftContainer(),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(child: rightContainer()),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      leftContainer(),
                      rightContainer(),
                    ],
                  ),
                )),
    );
  }

  Container rightContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppAssets.backgroundColor,
        borderRadius: const BorderRadius.only(
            // topRight: Radius.circular(16.0),
            // bottomRight: Radius.circular(16.0),
            ),
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: 'Reminders Activity',
                  fSize: 16.0,
                  fWeight: FontWeight.w700,
                ),
                CustomTextWidget(
                  text: 'View all',
                  fSize: 12.0,
                  fWeight: FontWeight.w700,
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return TimelineTile(
                  alignment: TimelineAlign.start,
                  indicatorStyle: const IndicatorStyle(
                    width: 10,
                    color: Colors.black,
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Reminder sent to ${reminders[index].email}',
                          maxLines: 4,
                          fSize: 14.0,
                        ),
                        CustomTextWidget(
                          text: 'Date: ${reminders[index].date}',
                          maxLines: 4,
                          fSize: 12.0,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container leftContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppAssets.backgroundColor,
        borderRadius: const BorderRadius.only(
            // topLeft: Radius.circular(16.0),
            // bottomLeft: Radius.circular(16.0),
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextWidget(
                text: 'Reminder Schedule ',
                fSize: 22.0,
                fWeight: FontWeight.w500,
              ),
              const CircleAvatar(
                child: Icon(Icons.add),
                radius: 15,
              )
            ],
          ),

          CustomTextWidget(
            text:
                'The reminder time  is where you define exactly how the system will follow up on your invoices with your customers.',
            fSize: 14.0,
            maxLines: 7,
          ),
          const SizedBox(height: 20.0),
      Container(
        height: Get.height * 0.62,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              DataColumn(
                label: Text(
                  'Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Expiry',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Count',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Status',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  cells: [ // S.No column
                    DataCell(Text(rowData[index].id)),
                    DataCell(Text(rowData[index].email)),
                    DataCell(Text(rowData[index].number)),
                    DataCell(Text(rowData[index].expiry)),
                    DataCell(Text(rowData[index].count)),
                    DataCell(Text(rowData[index].status)),

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
      ),
          // Container(
          //   height: 50,
          //   color: AppAssets.primaryColor,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       CustomTextWidget(text: "Email",fSize: 16,textColor: Colors.white,fWeight: FontWeight.w500),
          //       CustomTextWidget(text: "Phone#",fSize: 16,textColor: Colors.white,fWeight: FontWeight.w500),
          //       CustomTextWidget(text: "Count",fSize: 16,textColor: Colors.white,fWeight: FontWeight.w500),
          //       CustomTextWidget(text: "Status",fSize: 16,textColor: Colors.white,fWeight: FontWeight.w500),
          //
          //     ],
          //   ),
          // ),
          // Container(
          //   height: Get.height * 0.62,
          //   padding: EdgeInsets.all(10),
          //  // color: Colors.red,
          //   child: ListView.builder(
          //       physics: const BouncingScrollPhysics(),
          //       itemCount: 100,
          //       shrinkWrap: true,
          //       itemBuilder: (BuildContext context, int index) {
          //         return  Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               CustomTextWidget(text: "muneebshahzad@gmail.com",fSize: 14),
          //               CustomTextWidget(text: "+923298928398",fSize: 14),
          //               CustomTextWidget(text: "05",fSize: 14),
          //               CustomTextWidget(text: "Rejected",fSize: 14),
          //
          //             ],
          //           ),
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
