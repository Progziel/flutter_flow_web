import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:document_management_web/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class DocumentForm extends StatefulWidget {
  const DocumentForm({super.key});

  @override
  _DocumentFormState createState() => _DocumentFormState();
}

class _DocumentFormState extends State<DocumentForm> {
  List<String> documentTypes = ['.pdf', '.doc', '.png', '.jpg', '.jpeg'];
  List<Map<String, String>> documentList = [];
  List<TextEditingController> nameControllers = [];
  List<TextEditingController> typeControllers = [];
  final QuillController _controller = QuillController.basic();
  @override
  void initState() {
    super.initState();
    // Initialize controllers for text fields
    for (int i = 0; i < documentList.length; i++) {
      nameControllers.add(TextEditingController());
      typeControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Container(
        padding: const EdgeInsets.all(10),
        height: context.height * 0.25,
        width: context.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(
              color: Colors.grey,
            )),
        child: documentList.isEmpty
            ? Center(
                child: CustomTextWidget(
                    text: 'Click on Add button to get started.'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: documentList.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: context.isLandscape
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: _questionColumn(index),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: _dropdownColumn(),
                                  ),
                                ],
                              ),
                              // Expanded(child: _textEditor())
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _questionColumn(index),
                              const SizedBox(height: 20),
                              const Divider(
                                color: Colors.grey,
                              )
                            ],
                          ),
                  );
                },
              ),
      ),
      const SizedBox(height: 5),
      CustomButtonWidget(
        buttonText: 'ADD',
        width: 150,
        onTap: () {
          setState(() {
            // Add a new row to the list and initialize controllers
            documentList.add({
              'documentName': '',
              'documentType': '',
            });
            nameControllers.add(TextEditingController());
            typeControllers.add(TextEditingController());
          });
        },
      ),
    ]));
  }

  Column _dropdownColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: 'Document Type'),
        const SizedBox(height: 5),
        CustomDropDown(
          dropDownText: '.pdf',
          color: Colors.white,
          list: documentTypes,
        ),
      ],
    );
  }

  Column _questionColumn(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: 'Document Name'),
        const SizedBox(height: 5),
        CustomTextField(
          fillColor: Colors.white,
          controller: nameControllers[index],
          hintText: 'Document Name',
        ),
      ],
    );
  }

  // QuillProvider _textEditor() {
  //   return QuillProvider(
  //     configurations: QuillConfigurations(
  //       controller: _controller,
  //       sharedConfigurations: const QuillSharedConfigurations(
  //         locale: Locale('de'),
  //       ),
  //     ),
  //     child: Column(
  //       children: [
  //         const QuillToolbar(),
  //         Expanded(
  //           child: QuillEditor.basic(
  //             configurations: const QuillEditorConfigurations(
  //               readOnly: false,
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
