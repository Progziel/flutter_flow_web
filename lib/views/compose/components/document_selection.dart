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
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: generalController.documents.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: [
                                              TextSpan(
                                                text: '${index + 1}. ',
                                              ),
                                              TextSpan(
                                                text: 'Document Name: ',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextSpan(
                                                text: generalController
                                                    .documents[index].name,
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: [
                                              TextSpan(
                                                text: 'Document Type: ',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              TextSpan(
                                                text: generalController
                                                    .documents[index].fileType,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    generalController.deleteDocument(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    );
  }

  Widget _myDoc() => Padding(
        padding: const EdgeInsets.all(4.0),
        child: context.isLandscape
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _questionColumn(),
                  ),
                  const Spacer(),
                  Expanded(
                    child: _dropdownColumn(),
                  ),
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
        CustomTextWidget(text: 'Document Name'),
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
