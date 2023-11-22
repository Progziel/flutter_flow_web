import 'package:document_management_web/controller.dart';
import 'package:document_management_web/models/template_model.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/templates/components/add_template_stepper.dart';
import 'package:document_management_web/views/templates/custom_templates.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  // final List<Map<String, String>> templates = [
  //   {
  //     'name': 'Business Report Template',
  //     'description': 'A template for creating professional business reports.',
  //     'date': '2023-11-09',
  //   },
  //   {
  //     'name': 'Invoice Template',
  //     'description':
  //         'Generate invoices for your products and services with this template.',
  //     'date': '2023-11-10',
  //   },
  //   {
  //     'name': 'Meeting Agenda Template',
  //     'description':
  //         'Plan and organize your meetings with this agenda template.',
  //     'date': '2023-11-11',
  //   },
  //   {
  //     'name': 'Employee Handbook Template',
  //     'description': 'Create an employee handbook for your company policies.',
  //     'date': '2023-11-12',
  //   },
  //   {
  //     'name': 'Product Catalog Template',
  //     'description': 'Build a catalog to showcase your products and services.',
  //     'date': '2023-11-13',
  //   },
  //   {
  //     'name': 'Project Proposal Template',
  //     'description': 'Draft project proposals for clients or stakeholders.',
  //     'date': '2023-11-14',
  //   },
  //   {
  //     'name': 'Resume Template',
  //     'description': 'Design a professional resume for job applications.',
  //     'date': '2023-11-15',
  //   },
  //   {
  //     'name': 'Survey Form Template',
  //     'description': 'Craft surveys to gather valuable feedback and data.',
  //     'date': '2023-11-16',
  //   },
  //   {
  //     'name': 'Legal Contract Template',
  //     'description': 'Create legally binding contracts for various purposes.',
  //     'date': '2023-11-17',
  //   },
  //   {
  //     'name': 'Marketing Plan Template',
  //     'description':
  //         'Develop marketing plans and strategies for your business.',
  //     'date': '2023-11-18',
  //   },
  //   {
  //     'name': 'Expense Report Template',
  //     'description':
  //         'Track and report expenses incurred during business activities.',
  //     'date': '2023-11-19',
  //   },
  //   {
  //     'name': 'Newsletter Template',
  //     'description': 'Design and send newsletters to your subscribers.',
  //     'date': '2023-11-20',
  //   },
  //   {
  //     'name': 'Presentation Template',
  //     'description':
  //         'Prepare captivating presentations for meetings and events.',
  //     'date': '2023-11-21',
  //   },
  //   {
  //     'name': 'Event Program Template',
  //     'description': 'Plan and outline the schedule for an upcoming event.',
  //     'date': '2023-11-22',
  //   },
  //   {
  //     'name': 'Job Application Template',
  //     'description':
  //         'Simplify the job application process with this form template.',
  //     'date': '2023-11-23',
  //   },
  // ];
  MyTemplateModel? myTemplateModel;
  MyGeneralController controller = Get.find<MyGeneralController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            text: 'Templates',
                            fSize: 20,
                            fWeight: FontWeight.w700,
                          ),
                          const SizedBox(width: 10.0),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppAssets.primaryColor,
                            child: IconButton(
                              onPressed: () => _showAddTemplateDialog(),
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // controller.users
                    //     .map((users) => _buildUserList(users))
                    //     .toList(),
                    Wrap(
                      children: controller.templates.map((template) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                                CustomTemplates(title: template.name?? ''));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.grey.shade200,
                                width: 300,
                                child: ExpansionTile(
                                  backgroundColor: Colors.grey.shade50,
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomTextWidget(
                                          text: template.name ?? '',
                                          fSize: 18.0,
                                          fWeight: FontWeight.w600,
                                          //  maxLines: 2,
                                        ),
                                        CustomTextWidget(
                                          text:  removeHtmlTags(template.instruction ?? ''),
                                          fSize: 16.0,
                                          fWeight: FontWeight.w600,
                                          //  maxLines: 2,
                                        ),

                                        CustomTextWidget(
                                          text: template.description ?? '',
                                          fSize: 16.0,
                                          fWeight: FontWeight.w600,
                                          //  maxLines: 2,
                                        ),
                                        CustomTextWidget(
                                          text: "No. of Questions: ${template.questions.length}"?? '',
                                          fSize: 12.0,
                                          fWeight: FontWeight.w300,
                                          maxLines: 2,
                                        ),
                                        CustomTextWidget(
                                          text:
                                              'Created at: ${template.createdAt}',
                                          fSize: 12.0,
                                          fWeight: FontWeight.w300,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    CustomButtonWidget(
                                      buttonText: 'Edit Template',
                                      onTap: () {
                                        Get.to(CustomTemplates(
                                            title: template.name ?? ''));
                                      },
                                    ),
                                    CustomButtonWidget(
                                      buttonText: 'Use Template',
                                      onTap: () {},
                                    )
                                  ],
                                ),
                              )),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showAddTemplateDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomTextWidget(
            text: "Add Template",
            fSize: 18.0,
            fWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: Get.height * 0.85,
            width: Get.width * 0.7,
            color: Colors.white,
            child: const AddTemplateStepperWidget(),
          ),
        );
      },
    );
  }
  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}
