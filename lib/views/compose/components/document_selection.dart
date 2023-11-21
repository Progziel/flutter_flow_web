import 'package:document_management_web/controller.dart';
import 'package:document_management_web/models/template_model.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:document_management_web/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentForm extends StatefulWidget {
  const DocumentForm({Key? key}) : super(key: key);

  @override
  _DocumentFormState createState() => _DocumentFormState();
}

class _DocumentFormState extends State<DocumentForm> {
  MyGeneralController generalController = Get.find<MyGeneralController>();
  List<String> documentTypes = ['.pdf', '.doc', '.png', '.jpg', '.jpeg'];
  TextEditingController nameController = TextEditingController();
  String selectedDocumentType = '.pdf';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _myDoc(),
                  const SizedBox(height: 5),
                  CustomButtonWidget(
                    buttonText: 'ADD',
                    width: 150,
                    onTap: () {
                      String documentName = nameController.text;
                      String documentType = selectedDocumentType;
                      generalController.addDocument(
                          MyDocumentModel(name: documentName, fileType: documentType));
                      nameController.clear();
                      setState(() {});
                    },
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _myDoc() => Padding(
        padding: const EdgeInsets.all(4.0),
        child: context.isLandscape
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _questionColumn(),

                  _dropdownColumn(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _questionColumn(),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.grey,
                  )
                ],
              ),
      );

  Column _dropdownColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: 'Document Type'),
        const SizedBox(height: 5),
        CustomDropDown(
          dropDownText: selectedDocumentType,
          color: Colors.white,
          list: documentTypes,
          onChanged: (value) {
            setState(() {
              selectedDocumentType = value;
            });
          },
        ),
      ],
    );
  }

  Column _questionColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: 'Documents',fWeight: FontWeight.w500,fSize: 18),
        const SizedBox(height: 5),
        CustomTextField(
          fillColor: Colors.white,
          controller: nameController,
          hintText: 'Document Name',
        ),
      ],
    );
  }
}
