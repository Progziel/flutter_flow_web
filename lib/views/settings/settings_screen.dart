import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Widget _buildFormField(String labelText, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: labelText,
          fSize: 20.0,
          fWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10.0),
        CustomTextField(
          hintText: 'Enter $labelText',
          fillColor: Colors.white,
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  Widget _buildLogoSection() {
    return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              _buildFormField('Title', 'Enter Title'),
                              _buildFormField('Name', 'Enter Name'),
                              _buildFormField('Email', 'Enter Email'),
                              _buildFormField('Password', 'Enter Password'),
                            ],
                          ),
                          _buildLogoSection(),
                          const SizedBox(height: 15.0),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtonWidget(
                            width: context.width * 0.1,
                            buttonText: 'Save',
                            onTap: () {},
                          ),
                          CustomButtonWidget(
                              width: context.width * 0.1,
                              buttonText: 'Cancel',
                              buttonColor: Colors.red,
                              onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
