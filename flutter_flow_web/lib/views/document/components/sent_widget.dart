import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SentWidget extends StatefulWidget {
  const SentWidget({super.key});

  @override
  State<SentWidget> createState() => _SentWidgetState();
}

class _SentWidgetState extends State<SentWidget> {
  final List<Map<String, String>> templates = [
    {
      'name': 'Business Plan Template',
      'description':
          'Outline your business goals and strategies in a comprehensive plan.'
    },
    {
      'name': 'Travel Itinerary Template',
      'description': 'Organize travel plans and itineraries for trips.'
    },
    {
      'name': 'Recipe Book Template',
      'description':
          'Compile your favorite recipes into a personalized recipe book.'
    },
    {
      'name': 'Task List Template',
      'description': 'Keep track of tasks and to-do lists with this template.'
    },
    {
      'name': 'Family Budget Template',
      'description':
          'Manage and budget your family finances with this template.'
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
                                    buttonText: 'View',
                                    onTap: () {
                                      // Get.to(
                                      //     CustomTemplates(
                                      //       title: template['name'] ?? '',
                                      //     ),
                                      //     transition: Transition.zoom,
                                      //     duration: const Duration(
                                      //         milliseconds: 500));
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
