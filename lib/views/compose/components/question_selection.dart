import 'package:document_management_web/models/template_model.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller.dart';

class QuestionnaireForm extends StatefulWidget {
  const QuestionnaireForm({Key? key}) : super(key: key);

  @override
  _QuestionnaireFormState createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<QuestionnaireForm> {
  List<MyQuestionModel> questions = [];
  String selectedAnswerType = 'Text Field';
  TextEditingController questionTextController = TextEditingController();
  List<String> answerOptions = [];
  MyGeneralController generalController = Get.find<MyGeneralController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: context.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.black),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: context.isLandscape
                  ? Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: CustomTextWidget(
                                text: "Questionare",
                                fWeight: FontWeight.w500,
                                fSize: 18)),
                        SizedBox(
                          height: 8,
                        ),
                        _questionField(),
                        const SizedBox(height: 15.0),
                        _dropdown(context),
                      ],
                    )
                  : Column(
                      children: [
                        CustomTextWidget(
                            text: "Questionare", fWeight: FontWeight.w500),
                        _questionField(),
                        const SizedBox(height: 15.0),
                        _dropdown(context),
                      ],
                    ),
            ),
            if (selectedAnswerType == 'Checkbox' ||
                selectedAnswerType == 'Radio Button')
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: answerOptions.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                                border: InputBorder.none,
                                hintText:
                                    'Enter Answer ${(index + 1).toString()}',
                              ),
                              onChanged: (value) {
                                answerOptions[index] = value;
                                questions.last.choices = answerOptions;
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selectedAnswerType == 'Checkbox' ||
                    selectedAnswerType == 'Radio Button')
                  _addOptionButton(),
                _addQuestionButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  CustomButtonWidget _addOptionButton() {
    return CustomButtonWidget(
      width: 140,
      buttonText: 'Add Options',
      onTap: () {
        setState(() {
          answerOptions.add('');
        });
      },
    );
  }

  CustomButtonWidget _addQuestionButton() {
    return CustomButtonWidget(
      width: 140,
      buttonText: 'Add Question',
      onTap: () {
        String questions = questionTextController.text;
        String questionsType = selectedAnswerType;
        generalController.addQuestion1(MyQuestionModel(
            question: questions, type: questionsType, choices: answerOptions));
        questionTextController.clear();
        setState(() {});
        Get.back();

        //
        // setState(() {
        //   questions.add(MyQuestionModel(
        //     question: questionTextController.text,
        //     type: selectedAnswerType,
        //     choices: answerOptions,
        //   ));
        //   questionTextController.clear();
        //   answerOptions = [];
        // });
        // MyQuestionModel? question = questions.last;
        // ignore: avoid_print
        // print('Question: ${question.question}');
        // print('QuestionType: ${question.type}');
        // print('Options: ${question.choices ?? ""}');
        // print(questions.length);
      },
    );
  }

  Container _dropdown(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: DropdownButton<String>(
        alignment: Alignment.center,
        dropdownColor: Colors.white,
        focusColor: Colors.white,
        elevation: 0,
        underline: SizedBox(),
        borderRadius: BorderRadius.circular(12.0),
        value: selectedAnswerType,
        items: [
          'Text Field',
          'Rich Text Field',
          'Checkbox',
          'Radio Button',
        ].map((type) {
          return DropdownMenuItem<String>(
            value: type,
            child: CustomTextWidget(text: type),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedAnswerType = value!;
          });
        },
      ),
    );
  }

  CustomTextField _questionField() {
    return CustomTextField(
      fillColor: Colors.white,
      hintText: 'Enter Question',
      controller: questionTextController,
    );
  }

  void navigateToNextScreen(List<MyQuestionModel> submittedQuestions) {
    // Navigate to the next screen and pass the submitted questions as needed.
    // You can use Navigator to push a new route with the submitted data.
  }
}
