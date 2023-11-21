import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/document_selection.dart';
import 'package:document_management_web/views/compose/components/question_selection.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller.dart';

class FormDataWidget extends StatefulWidget {
  FormDataWidget({
    super.key,
  });

  @override
  State<FormDataWidget> createState() => _FormDataWidgetState();

}

class _FormDataWidgetState extends State<FormDataWidget>
    with SingleTickerProviderStateMixin {
  MyGeneralController generalController = Get.find<MyGeneralController>();

  TabController? _tabController;
  List<String> templates = [
    'Business Report Template',
    'Employee Handbook Template',
    'Invoice Template',
    'Meeting Agenda Template',
    'Product Catalog Template'
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tooltip(
              message: "Select Templates",
              child: InkWell(
                  onTap: ()async {
                    await _showMyDialog();
                  },
                  child: Icon(Icons.read_more,size: 35,)),
            ),
            Container(
              height: 50,
              width: context.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: TabBar(
                padding: const EdgeInsets.all(7),
                controller: _tabController,
                indicator: const BoxDecoration(
                  color: Colors.white,
                ),
                labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                labelColor: AppAssets.primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Documents', height: 40),
                  Tab(text: 'Questionare', height: 40),
                ],
              ),
            ),
            Tooltip(
              message: "Documents/Questionnaires",
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                          tabController: _tabController,
                        );
                      },
                    );
                    //   CustomAlertDialog(tabController: _tabController,);
                  },
                  child: Icon(Icons.add_circle,size: 30,)),
            ),
            // tab bar view here


          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: generalController.documents.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {

                    return Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(context)
                                            .style,
                                        children: [
                                          TextSpan(
                                            text: '${index + 1}. ',
                                          ),
                                          // TextSpan(
                                          //   text: 'Document Name: ',
                                          //   style: GoogleFonts.poppins(
                                          //     fontSize: 14,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                          TextSpan(
                                            text: generalController
                                                .documents[index].name,
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(context)
                                            .style,
                                        children: [
                                          TextSpan(
                                            text: 'Document Type: ',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: generalController
                                                .documents[index].fileType,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                generalController.deleteDocument(index);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    );
                  },
                ),
              ) ,
              Expanded(child: ListView.builder(
                  itemCount: generalController.questions.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index){
                    final questions = generalController.questions[index];
                    return Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(context)
                                            .style,
                                        children: [
                                          TextSpan(
                                            text: '${index + 1}. ',
                                          ),
                                          // TextSpan(
                                          //   text: 'Document Name: ',
                                          //   style: GoogleFonts.poppins(
                                          //     fontSize: 14,
                                          //     fontWeight: FontWeight.w600,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                          TextSpan(
                                            text: questions.question,
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(context)
                                            .style,
                                        children: [

                                          TextSpan(
                                            text: questions.type,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                generalController.deleteQuestion(index);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ],
                    );
                  }))
            ],
          ),
        ),


        //Dropdown

      ],
    ));
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  CustomTextWidget(text: 'SELECT TEMPLATE',fSize: 18,fWeight: FontWeight.w500),
          content:  CustomDropDown(
            list: templates,
            dropDownText: '',
            color: Colors.grey.shade200,
          ),
          actions: <Widget>[
            CustomButtonWidget(
              buttonText: 'ADD',
              width: 150,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }
  // Future<void> customDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('SELECT TEMPLATE'),
  //         content:
  //
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Confirm'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}



class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TabBar(
            //     controller: tabController,
            //     tabs: const [
            //       Tab(text: 'Documents'),
            //       Tab(text: 'Questionnaire'),
            //     ],
            //   ),
            // ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  DocumentForm(),
                  QuestionnaireForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
