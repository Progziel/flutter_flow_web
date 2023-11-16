import 'package:document_management_web/views/document/document_details.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecievedWidget extends StatefulWidget {
  const RecievedWidget({super.key});

  @override
  State<RecievedWidget> createState() => _RecievedWidgetState();
}

class _RecievedWidgetState extends State<RecievedWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white30,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 10.0,
                        child: ExpansionTile(
                          leading: const Icon(Icons.edit_document),
                          collapsedBackgroundColor: Colors.grey.shade200,
                          backgroundColor: Colors.white,
                          title: CustomTextWidget(
                            text: 'James Smith',
                            fSize: 16.0,
                            fWeight: FontWeight.w600,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(text: 'Email: james@gmail.com'),
                              CustomTextWidget(text: 'Expiration: 12-08-2023'),
                              CustomTextWidget(text: 'Reminder sent: yes'),
                            ],
                          ),
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomButtonWidget(
                                width: 180,
                                buttonText: 'See Documents',
                                onTap: () {
                                  Get.to(const DocumentDetailScreen(),
                                      transition: Transition.zoom,
                                      duration:
                                          const Duration(milliseconds: 500));
                                },
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

  void _showRejectionDialog(BuildContext context) {
    TextEditingController rejectionReasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomTextWidget(text: 'Rejection Reason'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(text: 'Enter the rejection reason:'),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Rejection Reason',
                fillColor: Colors.white,
                controller: rejectionReasonController,
              )
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonWidget(
                  buttonText: 'Send',
                  onTap: () {},
                ),
                CustomButtonWidget(
                  buttonText: 'Cancel',
                  buttonColor: Colors.red,
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
