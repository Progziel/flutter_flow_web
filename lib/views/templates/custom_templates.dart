import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomTemplates extends StatefulWidget {
  final String title;
  const CustomTemplates({super.key, required this.title});

  @override
  State<CustomTemplates> createState() => _CustomTemplatesState();
}

class _CustomTemplatesState extends State<CustomTemplates> {
  List<Map<String, dynamic>> documentsData = [
    {"name": "Birth Certificate", "type": "PDF"},
    {"name": "Passport", "type": "JPG"},
    {"name": "Resume", "type": "Doc"},
  ];

  List<Map<String, dynamic>> questionnairesData = [
    {
      "question": "What is the expiry date of certificate?",
      "options": ["this month", "next month", "next year", "after 5 years"],
    },
    {
      "question": "Which format is preferred?",
      "options": ["PDF", "Doc", "Image"],
    },
    {
      "question": "Additional comments?",
      "options": ["Text", "Audio", "None"],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
            text: widget.title, fSize: 20, fWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: const BorderRadius.all(Radius.circular(16.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: 'Documents',
                                fSize: 20,
                                fWeight: FontWeight.w700,
                              ),
                              CustomButtonWidget(
                                buttonText: 'Use Template',
                                onTap: () {},
                              )
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: documentsData.length,
                            itemBuilder: (context, index) {
                              final document = documentsData[index];
                              return Card(
                                  color: Colors.white,
                                  child: ExpansionTile(
                                    title: ListTile(
                                      leading: CustomTextWidget(
                                        text: '\u2022',
                                        fWeight: FontWeight.bold,
                                      ),
                                      title: CustomTextWidget(
                                          text: document["name"]),
                                      subtitle: CustomTextWidget(
                                        text: document["type"],
                                        fSize: 12,
                                      ),
                                    ),
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomButtonWidget(
                                            buttonText: 'Edit',
                                            onTap: () {},
                                          ),
                                          CustomButtonWidget(
                                            buttonText: 'Remove',
                                            buttonColor: Colors.red,
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Questionnaires',
                            fSize: 20,
                            fWeight: FontWeight.w700,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: questionnairesData.length,
                            itemBuilder: (context, index) {
                              final questionnaire = questionnairesData[index];
                              return Card(
                                  color: Colors.white,
                                  child: ExpansionTile(
                                    title: ListTile(
                                      leading: CustomTextWidget(
                                        text: '\u2022',
                                        fWeight: FontWeight.bold,
                                      ),
                                      title: CustomTextWidget(
                                          text: questionnaire["question"]),
                                      subtitle: SizedBox(
                                        height: 50, // Set a suitable height
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount:
                                              questionnaire["options"].length,
                                          itemBuilder: (context, index) {
                                            final option =
                                                questionnaire["options"][index];
                                            return Row(
                                              children: [
                                                const SizedBox(width: 5),
                                                const Icon(
                                                    Icons.arrow_right_rounded),
                                                const SizedBox(width: 10),
                                                CustomTextWidget(
                                                  text: option,
                                                  fSize: 12,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomButtonWidget(
                                            buttonText: 'Edit',
                                            onTap: () {},
                                          ),
                                          CustomButtonWidget(
                                            buttonText: 'Remove',
                                            buttonColor: Colors.red,
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
