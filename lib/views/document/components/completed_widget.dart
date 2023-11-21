import 'package:document_management_web/views/templates/custom_templates.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedWidget extends StatefulWidget {
  const CompletedWidget({super.key});

  @override
  State<CompletedWidget> createState() => _CompletedWidgetState();
}

class _CompletedWidgetState extends State<CompletedWidget> {
  final List<Map<String, String>> templates = [
    {
      'name': 'Survey Form Template',
      'description': 'Craft surveys to gather valuable feedback and data.'
    },
    {
      'name': 'Legal Contract Template',
      'description': 'Create legally binding contracts for various purposes.'
    },
    {
      'name': 'Marketing Plan Template',
      'description': 'Develop marketing plans and strategies for your business.'
    },
    {
      'name': 'Expense Report Template',
      'description':
          'Track and report expenses incurred during business activities.'
    },
    {
      'name': 'Newsletter Template',
      'description': 'Design and send newsletters to your subscribers.'
    },
    {
      'name': 'Presentation Template',
      'description':
          'Prepare captivating presentations for meetings and events.'
    },
    {
      'name': 'Event Program Template',
      'description': 'Plan and outline the schedule for an upcoming event.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              //height: 400,
              color: Colors.white30,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: templates.length,
                itemBuilder: (context, index) {
                  final template = templates[index];
                  return Column(
                    children: [
                      Card(
                        elevation: 10.0,
                        child: ExpansionTile(
                          leading: const Icon(Icons.edit_document),
                          collapsedBackgroundColor: Colors.grey.shade200,
                          backgroundColor: Colors.white,
                          title: CustomTextWidget(
                            text: template['name'] ?? '',
                            fSize: 16.0,
                            fWeight: FontWeight.w700,
                          ),
                          subtitle: CustomTextWidget(
                              text: template['description'] ?? ''),
                          children: [
                            Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButtonWidget(
                                    buttonText: 'Edit',
                                    onTap: () {
                                      Get.to(
                                          CustomTemplates(
                                            title: template['name'] ?? '',
                                          ),
                                          transition: Transition.zoom,
                                          duration: const Duration(
                                              milliseconds: 500));
                                    },
                                  ),
                                  CustomButtonWidget(
                                    buttonText: 'Delete',
                                    buttonColor: Colors.red,
                                    onTap: () {
                                      setState(() {
                                        templates.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
