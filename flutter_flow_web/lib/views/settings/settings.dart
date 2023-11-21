import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
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
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.1),
      child: SizedBox(
        width: context.width * 0.32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );
  }
}

class PasswordSettings extends StatelessWidget {
  const PasswordSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.1, vertical: context.height * 0.1),
      child: SizedBox(
        width: context.width * 0.32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'Change Password',
              fSize: 16.0,
              fWeight: FontWeight.w700,
            ),
            const SizedBox(height: 15.0),
            const CustomTextField(
                hintText: 'Current Password', fillColor: Colors.white),
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
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: CustomTextWidget(
            text: 'Company\'s Information',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          width: context.width * 0.32,
          child: const CustomTextField(
              hintText: 'Company Name', fillColor: Colors.white),
        ),
        const SizedBox(height: 15.0),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 22.0,
            vertical: 10.0,
          ),
          height: context.height * 0.4,
          width: context.width * 0.32,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextWidget(
                text: 'Logo',
                fSize: 16.0,
                fWeight: FontWeight.w600,
              ),
              Container(
                width: context.width * 0.2,
                height: context.height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey)),
                child: Image.asset(
                  'assets/images/app-logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 35,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: AppAssets.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              CustomButtonWidget(
                width: context.width * 0.15,
                buttonText: 'Change Theme Color',
                onTap: () {
                  showColorPickerDialog(
                      context, Color(0xff443a49), currentColor, (Color color) {
                    setState(() {
                      // Update your theme color or any other logic based on the selected color
                      currentColor = color;
                    });
                  });
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Align(
          alignment: Alignment.center,
          child: CustomButtonWidget(
            width: context.width * 0.1,
            buttonText: 'Save',
            onTap: () {},
          ),
        )
      ],
    );
  }

  void showColorPickerDialog(BuildContext context, Color initialColor,
      Color currentColor, Function(Color) onColorChanged) {
    Color pickerColor = initialColor;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomTextWidget(
            text: 'Pick a color!',
            fWeight: FontWeight.w500,
            fSize: 16.0,
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              borderColor: pickerColor,
              onColorChanged: onColorChanged,
            ),
            // Additional ColorPicker options can be used (commented out).
          ),
          actions: <Widget>[
            CustomButtonWidget(
              width: 200,
              buttonText: 'Change',
              onTap: () {
                onColorChanged(pickerColor);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
