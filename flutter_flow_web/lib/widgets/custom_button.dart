import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  const CustomButtonWidget(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width,
      this.buttonColor = AppAssets.primaryColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 35,
            width: width,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomTextWidget(
                text: buttonText,
                fSize: 14,
                textColor: textColor ?? Colors.white,
                fWeight: FontWeight.w300,
              ),
            ))),
      ),
    );
  }
}
