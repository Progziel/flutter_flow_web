import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            tabs: const [
              Tab(text: 'Reciever', height: 40),
              Tab(text: 'Groups', height: 40),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        // tab bar view here
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              TableData(),
              TableData(),
            ],
          ),
        ),
      ],
    );
  }
}
