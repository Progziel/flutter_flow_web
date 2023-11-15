import 'package:document_management_web/views/templates/custom_templates.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingWidget extends StatefulWidget {
  const PendingWidget({super.key});

  @override
  State<PendingWidget> createState() => _PendingWidgetState();
}

class _PendingWidgetState extends State<PendingWidget> {
  final List<Map<String, String>> templates = [
    {
      'name': 'Business Report Template',
      'description': 'A template for creating professional business reports.'
    },
    {
      'name': 'Invoice Template',
      'description':
          'Generate invoices for your products and services with this template.'
    },
    {
      'name': 'Meeting Agenda Template',
      'description':
          'Plan and organize your meetings with this agenda template.'
    },
    {
      'name': 'Employee Handbook Template',
      'description': 'Create an employee handbook for your company policies.'
    },
    {
      'name': 'Product Catalog Template',
      'description': 'Build a catalog to showcase your products and services.'
    },
    {
      'name': 'Project Proposal Template',
      'description': 'Draft project proposals for clients or stakeholders.'
    },
    {
      'name': 'Resume Template',
      'description': 'Design a professional resume for job applications.'
    },
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
    {
      'name': 'Job Application Template',
      'description':
          'Simplify the job application process with this form template.'
    },
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
