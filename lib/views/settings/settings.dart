import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
                        text: 'Settings', fSize: 20, fWeight: FontWeight.w700),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: Get.width * 0.4,
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
                        text: 'General',
                        height: 40,
                      ),
                      Tab(
                        text: 'Password',
                        height: 40,
                      ),
                      Tab(
                        text: 'About',
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
                    GeneralSettings(),
                    PasswordSettings(),
                    AboutSettings()
                    // SentWidget(),
                    // CompletedWidget(),
                    // PendingWidget()
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

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: 'General Information',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          const SizedBox(height: 15.0),
          const CustomTextField(
              hintText: 'Enter your Name', fillColor: Colors.white),
          const SizedBox(height: 15.0),
          const CustomTextField(
              hintText: 'Enter your Email', fillColor: Colors.white),
          const SizedBox(height: 15.0),
          const CustomTextField(
              hintText: 'Enter your Number', fillColor: Colors.white),
          const SizedBox(height: 15.0),
          CustomButtonWidget(
            width: context.width * 0.1,
            buttonText: 'Save',
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class PasswordSettings extends StatelessWidget {
  const PasswordSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: 'Change Password',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          const SizedBox(height: 15.0),
          const CustomTextField(
              hintText: 'Current Passwordd', fillColor: Colors.white),
          const SizedBox(height: 15.0),
          const CustomTextField(
              hintText: 'Create Password', fillColor: Colors.white),
          const SizedBox(height: 15.0),
          const CustomTextField(
              hintText: 'Confirm Password', fillColor: Colors.white),
          const SizedBox(height: 15.0),
          CustomButtonWidget(
            width: context.width * 0.1,
            buttonText: 'Save',
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class AboutSettings extends StatefulWidget {
  const AboutSettings({super.key});

  @override
  State<AboutSettings> createState() => _AboutSettingsState();
}

class _AboutSettingsState extends State<AboutSettings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: 'Company\'s Information',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          const SizedBox(height: 15.0),
          const CustomTextField(
              hintText: 'Company Name', fillColor: Colors.white),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 16.0,
                ),
                height: Get.context!.height * 0.45,
                width: Get.context!.width * 0.3,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Logo',
                        fSize: 16.0,
                        fWeight: FontWeight.w600,
                      ),
                      Container(
                        width: 400,
                        height: 200,
                        color: Colors.grey.shade200,
                        child: Image.asset(
                          'assets/images/app-logo.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              height: 35,
                              width: 150,
                              decoration: const BoxDecoration(
                                color: AppAssets.primaryColor,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.file_upload_rounded,
                                        color: Colors.white,
                                      ),
                                      CustomTextWidget(
                                        text: 'Change Logo',
                                        fSize: 14,
                                        textColor: Colors.white,
                                        fWeight: FontWeight.w300,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          CustomButtonWidget(
            width: context.width * 0.1,
            buttonText: 'Save',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
