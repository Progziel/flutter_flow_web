import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/document/components/completed_widget.dart';
import 'package:document_management_web/views/document/components/pending_widget.dart';
import 'package:document_management_web/views/document/components/recieved_widget.dart';
import 'package:document_management_web/views/document/components/request_widget.dart';
import 'package:document_management_web/views/document/components/sent_widget.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppAssets.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                        text: 'Documents', fSize: 20, fWeight: FontWeight.w700),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TabBar(
                    padding: const EdgeInsets.all(7),
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppAssets.primaryColor,
                    ),
                    labelStyle:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    tabs: const [
                      Tab(
                        text: 'Request',
                        height: 40,
                      ),
                      Tab(
                        text: 'Recieved',
                        height: 40,
                      ),
                      Tab(
                        text: 'Sent',
                        height: 40,
                      ),
                      Tab(
                        text: 'Completed',
                        height: 40,
                      ),
                      Tab(
                        text: 'Pending',
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    RequestedWidget(),
                    RecievedWidget(),
                    SentWidget(),
                    CompletedWidget(),
                    PendingWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
