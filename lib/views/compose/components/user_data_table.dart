import 'package:document_management_web/controller.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/users_table.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class UserDataTable extends StatefulWidget {
  const UserDataTable({
    super.key,
  });

  @override
  State<UserDataTable> createState() => _UserDataTableState();
}

class _UserDataTableState extends State<UserDataTable>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  MyGeneralController _controller = Get.find<MyGeneralController>();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
        //Tabbar
        Container(
          height: 50,
          width: context.width * 0.5,
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
            tabs: [
              Tab(height: 40, child: CustomTextWidget(text: 'Entry')),
              Tab(height: 40, child: CustomTextWidget(text: 'Clients')),
              Tab(height: 40, child: CustomTextWidget(text: 'Groups')),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        // tab bar view here
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              const IndividualRequest(),
              UserTable(
                users: _controller.users,
                onSelected: (List<UserModel> list) =>
                    _controller.setSelectedQuestions(list),
              ),
              UserTable(
                users: _controller.users,
                onSelected: (List<UserModel> list) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IndividualRequest extends StatelessWidget {
  const IndividualRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Name', fillColor: Colors.grey.shade200),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Number', fillColor: Colors.grey.shade200),
          const SizedBox(height: 15.0),
          CustomTextField(hintText: 'Address', fillColor: Colors.grey.shade200),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
