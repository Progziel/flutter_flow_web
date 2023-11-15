import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<UserData> usersData = [
    UserData(name: "Andrew", email: "andrew@gmail.com"),
    UserData(name: "Alice", email: "alice@gmail.com"),
    UserData(name: "Bob", email: "bob@gmail.com"),
  ];

  List<DocumentData> documentsData = [
    DocumentData(name: "Birth Certificate", type: "PDF"),
    DocumentData(name: "Passport", type: "JPG"),
    DocumentData(name: "Resume", type: "Doc"),
  ];

  List<QuestionnaireData> questionnairesData = [
    QuestionnaireData(
      question: "What is the expiry date of certificate?",
      options: ["PDF", "Doc", "Image", "Other"],
    ),
    QuestionnaireData(
      question: "Which format is preferred?",
      options: ["PDF", "Doc", "Image"],
    ),
    QuestionnaireData(
      question: "Additional comments?",
      options: ["Text", "Audio", "None"],
    ),
  ];

  Widget _buildExpandableTile(String title, List<dynamic> data) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(12.0),
      backgroundColor: Colors.grey.shade300,
      collapsedBackgroundColor: Colors.white,
      collapsedIconColor: Colors.black,
      iconColor: Colors.black,
      title: CustomTextWidget(
        text: title,
        fSize: 18,
        fWeight: FontWeight.w400,
      ),
      children: data.map((item) {
        if (item is UserData) {
          return _buildUserTile(item);
        } else if (item is DocumentData) {
          return _buildDocumentTile(item);
        } else if (item is QuestionnaireData) {
          return _buildQuestionnaireTile(item);
        } else {
          return Container(); // Handle other data types if needed
        }
      }).toList(),
    );
  }

  Widget _buildUserTile(UserData user) {
    return Card(
      child: ListTile(
        leading: CustomTextWidget(
          text: '\u2022',
          fWeight: FontWeight.bold,
        ),
        title: CustomTextWidget(text: user.name),
        subtitle: CustomTextWidget(
          text: user.email,
          fSize: 12,
        ),
        trailing: CustomButtonWidget(
          width: context.width * 0.1,
          buttonText: 'Remove',
          buttonColor: Colors.red,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildDocumentTile(DocumentData document) {
    return Card(
      child: ListTile(
        leading: CustomTextWidget(
          text: '\u2022',
          fWeight: FontWeight.bold,
        ),
        title: CustomTextWidget(text: document.name),
        subtitle: CustomTextWidget(
          text: document.type,
          fSize: 12,
        ),
        trailing: CustomButtonWidget(
          width: context.width * 0.1,
          buttonText: 'Remove',
          buttonColor: Colors.red,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildQuestionnaireTile(QuestionnaireData questionnaire) {
    return Card(
      child: ListTile(
        title: CustomTextWidget(text: questionnaire.question),
        subtitle: CustomTextWidget(
          text: questionnaire.options
              .join(', '), // Display options as a comma-separated string
          fSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, border: Border.all(color: Colors.black)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildExpandableTile('Users', usersData),
              _buildExpandableTile('Documents', documentsData),
              _buildExpandableTile('Questionnaires', questionnairesData),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Due Date',
                        fSize: 18,
                        fWeight: FontWeight.w400,
                      ),
                      CustomTextWidget(
                        text: '17-11-2023',
                        fSize: 14,
                        fWeight: FontWeight.w300,
                      ),
                      const Divider(),
                      CustomTextWidget(
                        text: 'Reminders',
                        fSize: 18,
                        fWeight: FontWeight.w400,
                      ),
                      CustomTextWidget(
                        text: '18-11-2023',
                        fSize: 14,
                        fWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserData {
  final String name;
  final String email;

  UserData({
    required this.name,
    required this.email,
  });
}

class DocumentData {
  final String name;
  final String type;

  DocumentData({
    required this.name,
    required this.type,
  });
}

class QuestionnaireData {
  final String question;
  final List<String> options;

  QuestionnaireData({
    required this.question,
    required this.options,
  });
}
