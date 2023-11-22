import 'dart:math';

import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/date_selection.dart';
import 'package:document_management_web/views/compose/components/formdata.dart';
import 'package:document_management_web/views/compose/components/review.dart';
import 'package:document_management_web/views/compose/components/user_data_table.dart';
import 'package:document_management_web/views/dashboard/components/groups.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../controller.dart';
import '../../../models/template_model.dart';
import '../../main_screen.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  StepperWidgetState createState() => StepperWidgetState();
}

class StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  final TextEditingController _templateNameController = TextEditingController();
  MyGeneralController generalController = Get.find<MyGeneralController>();
  MyTemplateModel? myTemplateModel;
  MyQuestionModel? myQuestionModel;
  final List<bool> _completedSteps = [false, false, false, false, false];

  ///---quill
  final _toolbarColor = Colors.grey.shade200;
  // bool _hasFocus = false;
  //
  // void unFocusEditor() => instructionController.unFocus();
  //
  // // void setHtmlText(String text) async {
  // //   await instructionController.setText(text);
  // // }
  //
  // void getHtmlText() async {
  //   String? htmlText = await instructionController.getText();
  //   debugPrint(htmlText);
  // }

  @override
  void initState() {
    generalController.setQuillController();
    // instructionController.clear();

    // instructionController.onTextChanged((text) {
    //   debugPrint('listening to $text');
    // });
    // instructionController.onEditorLoaded(() {
    //   debugPrint('Editor Loaded :)');
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    /// please do not forget to dispose the controller
    // _instructionController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Stepper(
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        onStepContinue: () {
          setState(() {
            _completedSteps[_currentStep] = true;
            if (_currentStep < _completedSteps.length - 1) {
              _currentStep++;
            }
          });
        },
        controlsBuilder: (context, details) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                  buttonText: 'Back', onTap: details.onStepCancel!),
              Visibility(
                visible: _currentStep >= 3,
                child: CustomButtonWidget(
                  buttonText: 'Save as Template',
                  onTap: () {
                    _showTemplateNameDialog();
                  },
                ),
              ),
              CustomButtonWidget(
// <<<<<<< HEAD
                buttonText: _currentStep < 4 ? 'Next' : 'Send Request',
                onTap: () async {
                  if (_currentStep < 4) {
                    details.onStepContinue!();

                    print('object');
                    //
                    // print('rizwan added: ${generalController.selectedUsers.length}');
// =======
//                 buttonText: _currentStep >= 3 ? 'Send Request' : 'Next',
//                 onTap: () {
//                   details.onStepContinue!();
//                   if (_currentStep > 3) {
// >>>>>>> 96c7f1011d5cbce59b86fac71e71c1cd6c596187
                    // Generate a random link
                    // String randomLink = generateRandomLink();
                    //
                    // // Show the random link to the user
                    // final snackBar = SnackBar(
                    //   duration: const Duration(seconds: 1),
                    //   backgroundColor: Colors.green,
                    //   content: Text(
                    //       'Request sent successfully. Random link: $randomLink'),
                    // );
                    //
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    generalController.addLeadForm();

                    sideMenu.changePage(2);
                  }
                },
              ),
            ],
          );
        },
        connectorThickness: 3.0,
        connectorColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) => AppAssets.primaryColor,
        ),
        type: StepperType.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        steps: [
          //Step1
          Step(
            isActive: _currentStep >= 0,
            label: CustomTextWidget(text: 'Document\'s Selection'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
            content: Container(

                height: context.height * 0.55,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                child: _flutterQuill()),
          ),
          //Step2
          Step(
            isActive: _currentStep >= 1,
            label: CustomTextWidget(text: 'Document\'s Selection'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),

              padding: const EdgeInsets.all(16.0),
              child: FormDataWidget(),
            ),
          ),
          //Step3
          // Step(
          //   isActive: _currentStep >= 2,
          //   label: CustomTextWidget(text: 'Question Selection'),
          //   title: CustomTextWidget(text: ''),
          //   state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
          //   content: Container(
          //     height: context.height * 0.55,
          //     color: Colors.white,
          //     padding: const EdgeInsets.all(16.0),
          //     child: const QuestionnaireForm(),
          //   ),
          // ),
          //Step2
          Step(
            isActive: _currentStep >= 2,
            label: CustomTextWidget(text: 'Client Selection'),

            title: CustomTextWidget(text: ''),
            state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const UserDataTable(),
            ),
          ),
          //Step4
          Step(
            isActive: _currentStep >= 2,
            label: CustomTextWidget(text: 'Date Selection'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const DueDateAndRemindersForm(),
            ),
          ),
          //Step5
          Step(
            isActive: _currentStep >= 3,
            label: CustomTextWidget(text: 'Review'),
            title: CustomTextWidget(text: ''),
            state: _currentStep >= 4 ? StepState.complete : StepState.indexed,
            content: Container(
              height: context.height * 0.55,
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: const ReviewScreen(),
            ),
          ),
        ],
        currentStep: _currentStep,
      ),
    );
  }

  void _showTemplateNameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomTextWidget(text: 'Enter Template Name'),
          content: CustomTextField(
            hintText: 'Template Name',
            fillColor: Colors.white,
            controller: _templateNameController,
          ),
          actions: [
            CustomButtonWidget(
              buttonText: 'Cancel',
              buttonColor: Colors.red,
              onTap: () {
                Get.back();
              },
            ),
            CustomButtonWidget(
              buttonText: 'Save',
// <<<<<<< HEAD
              onTap: () async {
                generalController.addTemplate(MyTemplateModel(
                    name: _templateNameController.text,
                    documents: generalController.documents,
                    questions: generalController.questions1,
                    description: "",
                    instruction:
                        await controller.instructionController.getText(),
                    createdAt: DateTime.now()));

                _saveTemplate();
                // print(object)
// =======
//               onTap: () {
//                 _saveTemplate();
// >>>>>>> 96c7f1011d5cbce59b86fac71e71c1cd6c596187
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  void _saveTemplate() {
    // Your logic to save the template goes here

    // Show a SnackBar after saving
    const snackBar = SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.green,
      content: Text('Template saved successfully'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String generateRandomLink() {
    // You can customize the link generation logic based on your requirements.
    // For simplicity, I'm generating a random string here.
    const String characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    String randomLink = 'https://example.com/';

    for (int i = 0; i < 6; i++) {
      randomLink += characters[random.nextInt(characters.length)];
    }

    return randomLink;
  }


  Widget _flutterQuill() {
    return Column(children: [
      ToolBar(
        toolBarColor: _toolbarColor,
        padding: const EdgeInsets.all(8),
        iconSize: 25,
        iconColor: Colors.black87,
        activeIconColor: AppAssets.primaryColor,
        controller: controller.instructionController,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        customButtons: [],
      ),
      Expanded(
        child: QuillHtmlEditor(
          text: "",
          hintText: 'Type your instructions',
          controller: controller.instructionController,
          isEnabled: true,
          minHeight: 300,
          //   textStyle: _editorTextStyle,
          //   hintTextStyle: _hintTextStyle,
          hintTextAlign: TextAlign.start,
          padding: const EdgeInsets.only(left: 10, top: 5),
          hintTextPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
          onTextChanged: (text) => debugPrint('widget text change $text'),
          onEditorCreated: () => debugPrint('Editor has been loaded'),
          onEditingComplete: (s) => debugPrint('Editing completed $s'),
          onEditorResized: (height) => debugPrint('Editor resized $height'),
          onSelectionChanged: (sel) => debugPrint('${sel.index},${sel.length}'),
          loadingBuilder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 0.4,
            ));
          },
        ),
      ),
    ]);
  }

  Widget textButton({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: AppAssets.primaryColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: _toolbarColor),
          )),
    );
  }

}
