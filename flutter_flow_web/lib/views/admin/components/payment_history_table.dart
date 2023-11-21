import 'package:document_management_web/models/payment_history_model.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class PaymentHistoryTable extends StatefulWidget {
  const PaymentHistoryTable({Key? key}) : super(key: key);

  @override
  _PaymentHistoryTableState createState() => _PaymentHistoryTableState();
}

class _PaymentHistoryTableState extends State<PaymentHistoryTable> {
  bool selectAll = false;

  List<PaymentHistoryModel> paymentHistoryData = [
    PaymentHistoryModel(
      paymentInvoice: 'INV-001',
      amount: 100.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-002',
      amount: 150.0,
      date: DateTime.now(),
      status: 'Pending',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-003',
      amount: 200.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-004',
      amount: 75.0,
      date: DateTime.now(),
      status: 'Pending',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-005',
      amount: 180.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-006',
      amount: 220.0,
      date: DateTime.now(),
      status: 'Pending',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-007',
      amount: 300.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-008',
      amount: 90.0,
      date: DateTime.now(),
      status: 'Pending',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-009',
      amount: 120.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-010',
      amount: 250.0,
      date: DateTime.now(),
      status: 'Pending',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-011',
      amount: 160.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-012',
      amount: 130.0,
      date: DateTime.now(),
      status: 'Pending',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-013',
      amount: 190.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-014',
      amount: 300.0,
      date: DateTime.now(),
      status: 'Pending',
      selected: false,
    ),
    PaymentHistoryModel(
      paymentInvoice: 'INV-015',
      amount: 120.0,
      date: DateTime.now(),
      status: 'Paid',
      selected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(
                label: Checkbox(
                  activeColor: AppAssets.primaryColor,
                  value: selectAll,
                  onChanged: (value) {
                    setState(() {
                      selectAll = value!;
                      for (var data in paymentHistoryData) {
                        data.selected = value;
                      }
                    });
                  },
                ),
              ),
              DataColumn(
                label: CustomTextWidget(
                  text: 'Payment Invoice',
                  fSize: 16.0,
                ),
              ),
              DataColumn(
                label: CustomTextWidget(
                  text: 'Amount',
                  fSize: 16.0,
                ),
              ),
              DataColumn(
                label: CustomTextWidget(
                  text: 'Date',
                  fSize: 16.0,
                ),
              ),
              DataColumn(
                label: CustomTextWidget(
                  text: 'Status',
                  fSize: 16.0,
                ),
              ),
              DataColumn(
                label: CustomTextWidget(
                  text: '',
                  fSize: 16.0,
                ),
              ),
            ],
            rows: [
              for (int index = 0; index < paymentHistoryData.length; index++)
                DataRow(
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  color: MaterialStateColor.resolveWith((states) {
                    return index % 2 == 0
                        ? Colors.white
                        : Colors.grey.shade200; // Alternate row colors
                  }),
                  cells: [
                    DataCell(
                      Checkbox(
                        activeColor: AppAssets.primaryColor,
                        value: paymentHistoryData[index].selected,
                        onChanged: (value) {
                          setState(() {
                            paymentHistoryData[index].selected = value!;
                          });
                        },
                      ),
                    ),

                    DataCell(CustomTextWidget(
                        text: paymentHistoryData[index].paymentInvoice)),
                    DataCell(CustomTextWidget(
                        text: paymentHistoryData[index].amount.toString())),
                    DataCell(CustomTextWidget(
                        text: paymentHistoryData[index].date.toString())),
                    DataCell(CustomTextWidget(
                        text: paymentHistoryData[index].status)),
                    DataCell(TextButton(
                        onPressed: () {},
                        child: CustomTextWidget(
                          text: 'Download',
                          textColor: const Color.fromARGB(255, 7, 95, 167),
                        )))
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
    );
  }
}
