import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  ExpansionTileController expansionTileController = ExpansionTileController();
  final List<Map<String, dynamic>> templates = [
    {
      'name': 'Business Report Template',
      'description': 'A template for creating professional business reports.',
      'questions': [
        {
          'type': 'document',
          'title': 'Financial Statement',
          'dueDate': '2023-12-01'
        },
        {
          'type': 'text',
          'question': 'What is the main goal of your business report?',
          'answer': ''
        },
        {
          'type': 'radio',
          'question': 'Does the report include financial data?',
          'options': ['Yes', 'No'],
          'answer': ''
        },
        {
          'type': 'multi',
          'question': 'Select the sections to include in the report:',
          'options': ['Introduction', 'Methodology', 'Results', 'Conclusion'],
          'answer': []
        },
      ],
    },
  ];
  int currentQuestionIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppAssets.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: [
            context.isLandscape
                ? Row(
                    children: [
                      CustomButtonWidget(
                        buttonText: 'Expand All',
                        onTap: () {
                          setState(() {
                            isExpanded = true;
                            expansionTileController.expand();
                          });
                        },
                      ),
                      CustomButtonWidget(
                        buttonText: 'Collapse All',
                        onTap: () {
                          setState(() {
                            isExpanded = false;
                            expansionTileController.collapse();
                          });
                        },
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButtonWidget(
                        width: 120,
                        buttonText: 'Expand All',
                        onTap: () {
                          setState(() {
                            isExpanded = true;
                            expansionTileController.expand();
                          });
                        },
                      ),
                      CustomButtonWidget(
                        buttonText: 'Collapse All',
                        width: 120,
                        onTap: () {
                          setState(() {
                            isExpanded = false;
                            expansionTileController.collapse();
                          });
                        },
                      )
                    ],
                  ),
            ExpansionTile(
              collapsedBackgroundColor: Colors.grey.shade100,
              backgroundColor: Colors.grey.shade200,
              controller: expansionTileController,
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              title: CustomTextWidget(
                text: 'Lead Form',
                fSize: 18.0,
                fWeight: FontWeight.w600,
              ),
              leading: const Icon(Icons.edit_document),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/app-logo.png',
                      height: 60,
                    ),
                    CustomTextWidget(
                      text:
                          'Please upload the following documents before the expiry date of 31-November-2023',
                      fSize: 14.0,
                      fWeight: FontWeight.w400,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      textColor: Colors.grey,
                    ),
                    const SizedBox(height: 10.0),
                    context.isLandscape
                        ? Container(
                            height: context.height * 0.5,
                            width: context.width * 0.5,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            color: Colors.grey.shade300,
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount: templates.length,
                                      itemBuilder: (context, index) {
                                        final template = templates[index];
                                        return Column(
                                          children: _buildExpansionTiles(
                                              template['questions']),
                                        );
                                      },
                                    ),
                                    CustomButtonWidget(
                                      width: 100,
                                      buttonText: 'Submit',
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: context.height * 0.45,
                            width: context.width * 0.5,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            color: Colors.grey.shade300,
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount: templates.length,
                                      itemBuilder: (context, index) {
                                        final template = templates[index];
                                        return Column(
                                          children: _buildExpansionTiles(
                                              template['questions']),
                                        );
                                      },
                                    ),
                                    CustomButtonWidget(
                                      buttonText: 'Submit',
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildExpansionTiles(
    List<Map<String, dynamic>> questions,
  ) {
    return questions.map((question) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          leading: const Icon(Icons.edit_document),
          collapsedBackgroundColor: Colors.grey.shade200,
          backgroundColor: Colors.grey.shade50,
          title: CustomTextWidget(
            text: question['name'] ?? 'Template Name',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          subtitle: CustomTextWidget(
              text: question['description'] ?? 'Template Description'),
          children: [
            _buildQuestionWidget(question),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: question['type'] == 'document',
                  child: CustomButtonWidget(
                    buttonText: 'Upload',
                    onTap: () {},
                  ),
                ),
                CustomButtonWidget(
                  buttonText: 'Not Applicable',
                  onTap: () {},
                ),
                CustomButtonWidget(
                  buttonText: 'Skip',
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      );
    }).toList();
  }

  Widget _buildQuestionWidget(Map<String, dynamic> question) {
    return Column(
      children: [
        if (question['type'] == 'document')
          _buildDocumentWidget(question)
        else
          _buildAnswerWidget(question),
        // CustomButton(
        //   width: 200,
        //   buttonText: 'Next',
        //   onTap: () {
        //     setState(() {
        //       if (currentQuestionIndex < templates.length - 1) {
        //         currentQuestionIndex++;
        //       } else {
        //         // Reset the index to 0 if we've reached the end of questions
        //         currentQuestionIndex = 0;
        //       }
        //     });
        //   },
        // )
      ],
    );
  }

  Widget _buildAnswerWidget(Map<String, dynamic> question) {
    if (question['type'] == 'radio') {
      return ListTile(
        title: CustomTextWidget(text: question['question']),
        subtitle: Column(
          children: [
            for (var option in question['options'])
              RadioListTile(
                title: CustomTextWidget(text: option),
                value: option,
                groupValue: question['answer'],
                onChanged: (value) {
                  setState(() {
                    question['answer'] = value;
                  });
                },
              ),
          ],
        ),
      );
    } else if (question['type'] == 'multi') {
      return ListTile(
        title: CustomTextWidget(text: question['question']),
        subtitle: Column(
          children: [
            for (var option in question['options'])
              CheckboxListTile(
                title: CustomTextWidget(text: option),
                value: question['answer']?.contains(option) ?? false,
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      if (question['answer'] == null) {
                        question['answer'] = [];
                      }
                      if (value) {
                        question['answer'].add(option);
                      } else {
                        question['answer'].remove(option);
                      }
                    }
                  });
                },
              ),
          ],
        ),
      );
    } else {
      return ListTile(
        title: CustomTextWidget(text: question['question']),
        subtitle: CustomTextField(
          hintText: 'Answer...',
          controller: TextEditingController(text: question['answer']),
          fillColor: Colors.grey.shade200, // Set the desired fill color
        ),
      );
    }
  }

  Widget _buildDocumentWidget(Map<String, dynamic> document) {
    return ListTile(
      title: CustomTextWidget(text: 'Document: ${document['title']}'),
      subtitle: CustomTextWidget(
          text: 'Type: ${document['type']}, Due Date: ${document['dueDate']}'),
    );
  }
}
