import 'package:document_management_web/views/compose/components/document_selection.dart';
import 'package:document_management_web/views/compose/components/question_selection.dart';
import 'package:document_management_web/views/compose/components/review.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/constants.dart';

class AddTemplateStepperWidget extends StatefulWidget {
  const AddTemplateStepperWidget({super.key});

  @override
  _AddTemplateStepperWidgetState createState() =>
      _AddTemplateStepperWidgetState();
}

class _AddTemplateStepperWidgetState extends State<AddTemplateStepperWidget> {
  final TextEditingController _templateNameController = TextEditingController();

  int _currentStep = 0;
  final List<bool> _completedSteps = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: LayoutBuilder(
        builder: (a, b) => Stepper(
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
                CustomButtonWidget(
                  buttonText: _currentStep >= 2 ? 'Save as Template' : 'Next',
                  onTap: () {
                    if (_currentStep >= 2) {
                      _showTemplateNameDialog();
                    } else {
                      details.onStepContinue!();
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
          steps: [
            Step(
              isActive: _currentStep >= 0,
              label: CustomTextWidget(text: 'Document Selection'),
              title: CustomTextWidget(text: ''),
              state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
              content: Container(
                height: b.maxHeight * 0.64,
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: const DocumentForm(),
              ),
            ),
            Step(
              isActive: _currentStep >= 1,
              label: CustomTextWidget(text: 'Question Selection'),
              title: CustomTextWidget(text: ''),
              state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
              content: Container(
                height: b.maxHeight * 0.64,
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: const QuestionnaireForm(),
              ),
            ),
            Step(
              isActive: _currentStep >= 2,
              label: CustomTextWidget(text: 'Review'),
              title: CustomTextWidget(text: ''),
              state: _currentStep >= 3 ? StepState.complete : StepState.indexed,
              content: Container(
                height: b.maxHeight * 0.64,
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: const ReviewScreen(),
              ),
            ),
          ],
          currentStep: _currentStep,
        ),
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
}
