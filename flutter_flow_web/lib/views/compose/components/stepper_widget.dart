import 'dart:math';

import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/date_selection.dart';
import 'package:document_management_web/views/compose/components/formdata.dart';
import 'package:document_management_web/views/compose/components/review.dart';
import 'package:document_management_web/views/compose/components/user_data_table.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  StepperWidgetState createState() => StepperWidgetState();
}

class StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  final TextEditingController _templateNameController = TextEditingController();

  final List<bool> _completedSteps = [false, false, false, false];

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
                buttonText: _currentStep >= 3 ? 'Send Request' : 'Next',
                onTap: () {
                  details.onStepContinue!();
                  if (_currentStep > 3) {
                    // Generate a random link
                    String randomLink = generateRandomLink();

                    // Show the random link to the user
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.green,
                      content: Text(
                          'Request sent successfully. Random link: $randomLink'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              color: Colors.white,
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
            isActive: _currentStep >= 1,
            label: CustomTextWidget(text: 'User Selection'),
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
              onTap: () {
                _saveTemplate();
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
}
