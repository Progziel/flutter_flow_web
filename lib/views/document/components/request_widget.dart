import 'package:animations/animations.dart';
import 'package:document_management_web/controller.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class RequestedWidget extends StatefulWidget {
  const RequestedWidget({super.key});

  @override
  State<RequestedWidget> createState() => _RequestedWidgetState();
}


class _RequestedWidgetState extends State<RequestedWidget> {
MyGeneralController controller = Get.find<MyGeneralController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white30,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.leadForms.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      OpenContainer(
                        openColor: Colors.transparent,
                        closedColor: Colors.transparent,
                        transitionDuration: const Duration(milliseconds: 500),
                        closedBuilder: (context, action) => Card(
                            elevation: 10.0,
                            child: ListTile(
                              title: Text(controller.leadForms[index].dueDate
                                  .toString()),
                              leading: Icon(Icons.edit_document),
                              //title: ,
                            )),
                        openBuilder: (context, action) {
                          return Scaffold(
                            appBar: AppBar(),
                            body: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    _heading('Instructions:'),
                                    Text(controller.leadForms[index].dueDate
                                        .toString()),

                                    // QuillHtmlEditor(
                                    //   // text: "<h1>Hello</h1>This is a quill html editor example 😊",
                                    //   controller: controller.leadForms[index].instructionController,
                                    //   isEnabled: false,
                                    //   minHeight: 200,
                                    //   //   textStyle: _editorTextStyle,
                                    //   //   hintTextStyle: _hintTextStyle,
                                    //   hintTextAlign: TextAlign.start,
                                    //   padding: const EdgeInsets.only(left: 10, top: 5),
                                    //   hintTextPadding: EdgeInsets.zero,
                                    //   backgroundColor: Colors.white,
                                    //   onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
                                    //   onTextChanged: (text) => debugPrint('widget text change $text'),
                                    //   onEditorCreated: () => debugPrint('Editor has been loaded'),
                                    //   onEditingComplete: (s) => debugPrint('Editing completed $s'),
                                    //   onEditorResized: (height) => debugPrint('Editor resized $height'),
                                    //   onSelectionChanged: (sel) => debugPrint('${sel.index},${sel.length}'),
                                    //   loadingBuilder: (context) {
                                    //     return const Center(
                                    //         child: CircularProgressIndicator(
                                    //           strokeWidth: 0.4,
                                    //         ));
                                    //   },
                                    // ),
                                    FutureBuilder(
                                        future: controller.leadForms[index]
                                            .instructionController
                                            .getText(),
                                        builder: (bContext, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(snapshot.data!);
                                          }
                                          return Text(snapshot.data!);
                                        }),
                                    const Divider(),
                                    _heading('Documents:'),
                                    ...controller.leadForms[index].documents
                                        .map((e) =>
                                            _widget(e.name, e.fileType, null)),
                                    const Divider(),
                                    _heading('Questions::'),
                                    ...controller.leadForms[index].questions
                                        .map((e) => (e.type == 'Radio Button')
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(e.question),
                                                    if (e.choices != null)
                                                      ...e.choices!.map(
                                                        (c) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 8.0,
                                                                  top: 8.0),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 100,
                                                                  child:
                                                                      Text(c)),
                                                              Radio(
                                                                  value: false,
                                                                  groupValue:
                                                                      '',
                                                                  onChanged:
                                                                      (value) {}),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )
                                            : (e.type == 'Checkbox')
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(e.question),
                                                        if (e.choices != null)
                                                          ...e.choices!.map(
                                                            (c) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 8.0,
                                                                      top: 8.0),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                      width:
                                                                          100,
                                                                      child: Text(
                                                                          c)),
                                                                  Checkbox(
                                                                      value:
                                                                          false,
                                                                      onChanged:
                                                                          (value) {}),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  )
                                                : (e.type == 'Rich Text Field')
                                                    ? Column(
                                                        children: [
                                                          Text(e.question),
                                                          // QuillHtmlEditor(
                                                          //   // text: "<h1>Hello</h1>This is a quill html editor example 😊",
                                                          //   controller: controller.leadForms[index].instructionController,
                                                          //   isEnabled: false,
                                                          //   minHeight: 200,
                                                          //   //   textStyle: _editorTextStyle,
                                                          //   //   hintTextStyle: _hintTextStyle,
                                                          //   hintTextAlign: TextAlign.start,
                                                          //   padding: const EdgeInsets.only(left: 10, top: 5),
                                                          //   hintTextPadding: EdgeInsets.zero,
                                                          //   backgroundColor: Colors.white,
                                                          //   onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
                                                          //   onTextChanged: (text) => debugPrint('widget text change $text'),
                                                          //   onEditorCreated: () => debugPrint('Editor has been loaded'),
                                                          //   onEditingComplete: (s) => debugPrint('Editing completed $s'),
                                                          //   onEditorResized: (height) => debugPrint('Editor resized $height'),
                                                          //   onSelectionChanged: (sel) => debugPrint('${sel.index},${sel.length}'),
                                                          //   loadingBuilder: (context) {
                                                          //     return const Center(
                                                          //         child: CircularProgressIndicator(
                                                          //           strokeWidth: 0.4,
                                                          //         ));
                                                          //   },
                                                          // ),
                                                          // CustomButtonWidget(
                                                          //     buttonText:
                                                          //         'Upload',
                                                          //     onTap: () {})
                                                        ],
                                                      )
                                                    : _textFieldQuestion(
                                                        e.question)),
                                    _heading('Users:'),
                                    ...controller.leadForms[index].users
                                        .map((e) => Row(
                                              children: [
                                                Text(e.name),
                                                Text('...'),
                                                CustomButtonWidget(
                                                    buttonText: 'Upload',
                                                    onTap: () {})
                                              ],
                                            )),
                                    _heading('Reminders:'),
                                    ...controller.leadForms[index].reminders
                                        .map((e) => Row(
                                              children: [
                                                const Text('Date: '),
                                                Text(e.toString()),
                                                CustomButtonWidget(
                                                    buttonText: 'Upload',
                                                    onTap: () {})
                                              ],
                                            )),

                                    // QuillHtmlEditor(
                                    //   // text: "<h1>Hello</h1>This is a quill html editor example 😊",
                                    //   hintText: 'Type your instructions',
                                    //   controller: controller
                                    //       .leadForms[index].instructionController,
                                    //   isEnabled: false,
                                    //   minHeight: 300,
                                    //   //   textStyle: _editorTextStyle,
                                    //  //   hintTextStyle: _hintTextStyle,
                                    //   hintTextAlign: TextAlign.start,
                                    //   padding:
                                    //       const EdgeInsets.only(left: 10, top: 5),
                                    //   hintTextPadding: EdgeInsets.zero,
                                    //   backgroundColor: Colors.white,
                                    //   onFocusChanged: (hasFocus) =>
                                    //       debugPrint('has focus $hasFocus'),
                                    //   onTextChanged: (text) =>
                                    //       debugPrint('widget text change $text'),
                                    //   onEditorCreated: () =>
                                    //       debugPrint('Editor has been loaded'),
                                    //   onEditingComplete: (s) =>
                                    //       debugPrint('Editing completed $s'),
                                    //   onEditorResized: (height) =>
                                    //       debugPrint('Editor resized $height'),
                                    //   onSelectionChanged: (sel) =>
                                    //       debugPrint('${sel.index},${sel.length}'),
                                    //   loadingBuilder: (context) {
                                    //     return const Center(
                                    //         child: CircularProgressIndicator(
                                    //       strokeWidth: 0.4,
                                    //     ));
                                    //   },
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        openElevation: 0,
                        closedElevation:
                            0, // Set elevation to 0 to remove the shadow
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Set border radius to 0

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

  Widget _widget(String title, String type, String? selection) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          selection ?? 'Please Upload File',
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        )),
                        Text(
                          type,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButtonWidget(buttonText: 'Upload', onTap: () {})
              ],
            ),
          ],
        ),
      );

  Widget _textFieldQuestion(String title) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            CustomTextField(
                hintText: 'Enter your text here', fillColor: Colors.white),
          ],
        ),
      );

  Text _heading(String text) => Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      );

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
