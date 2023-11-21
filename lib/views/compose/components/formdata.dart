import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/document_selection.dart';
import 'package:document_management_web/views/compose/components/question_selection.dart';
import 'package:document_management_web/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDataWidget extends StatefulWidget {
  FormDataWidget({
    super.key,
  });

  @override
  State<FormDataWidget> createState() => _FormDataWidgetState();
  List<String> templates = [
    'Business Report Template',
    'Employee Handbook Template',
    'Invoice Template',
    'Meeting Agenda Template',
    'Product Catalog Template'
  ];
}

class _FormDataWidgetState extends State<FormDataWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Dropdown
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDropDown(
              list: widget.templates,
              dropDownText: 'Select Template',
              color: Colors.grey.shade200,
            ),

            //Tabbar
            Container(
              height: 50,
              width: context.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: TabBar(
                padding: const EdgeInsets.all(7),
                controller: _tabController,
                indicator: const BoxDecoration(
                  color: Colors.white,
                ),
                labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                labelColor: AppAssets.primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Documents', height: 40),
                  Tab(text: 'Questionare', height: 40),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        // tab bar view here
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              DocumentForm(),
              QuestionnaireForm(),
            ],
          ),
        ),
      ],
    );
  }
}
