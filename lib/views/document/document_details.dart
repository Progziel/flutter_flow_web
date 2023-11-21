import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentDetailScreen extends StatefulWidget {
  const DocumentDetailScreen({super.key});

  @override
  State<DocumentDetailScreen> createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: 'Document Details',
          fSize: 16.0,
          fWeight: FontWeight.w400,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                buttonText: 'Manual Reminder',
                onTap: () {},
              ),
              CustomButtonWidget(
                buttonText: 'Mark as Completed',
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15.0),
                Container(
                  height: Get.height * 0.6,
                  width: context.width * 0.5,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  color: Colors.grey.shade300,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: templates.length,
                      itemBuilder: (context, index) {
                        final template = templates[index];
                        return Column(
                          children: [
                            Column(
                              children:
                                  _buildExpansionTiles(template['questions']),
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                CustomButtonWidget(
                  width: context.width * 0.1,
                  buttonText: 'Download as Zip',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
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
            text: question['name'] ?? 'Document Name',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          subtitle: CustomTextWidget(
              text: question['description'] ?? 'Document Description'),
          children: [
            _buildQuestionWidget(question),
            Visibility(
              visible: question['type'] == 'document',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonWidget(
                    buttonText: 'Request Again',
                    buttonColor: Colors.red,
                    onTap: () {},
                  ),
                  CustomButtonWidget(
                    buttonText: 'Download',
                    onTap: () {},
                  )
                ],
              ),
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
      ],
    );
  }

  Widget _buildAnswerWidget(Map<String, dynamic> question) {
    if (question['type'] == 'radio') {
      return ListTile(
          title: CustomTextWidget(text: question['question']),
          subtitle: Row(
            children: [
              CustomTextWidget(
                text: '•',
              ),
              const SizedBox(width: 10.0),
              CustomTextWidget(
                text: 'Yes',
              ),
            ],
          ));
    } else if (question['type'] == 'multi') {
      return ListTile(
        title: CustomTextWidget(text: question['question']),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomTextWidget(
                  text: '•',
                ),
                const SizedBox(width: 10.0),
                CustomTextWidget(
                  text: 'Introduction',
                ),
              ],
            ),
            Row(
              children: [
                CustomTextWidget(
                  text: '•',
                ),
                const SizedBox(width: 10.0),
                CustomTextWidget(
                  text: 'Methodology',
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return ListTile(
        title: CustomTextWidget(text: question['question']),
        subtitle: CustomTextWidget(
          text:
              'My primary business goal is to provide effective and innovative AI solutions that enhance productivity and problem-solving. Focused on fostering technological advancements, my aim is to contribute to industries, fostering a future where AI positively impacts diverse fields, facilitating efficient, intelligent, and ethical applications across various domains.',
          maxLines: 5,
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
