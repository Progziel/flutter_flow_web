import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fSize;
  final FontWeight? fWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  int? maxLines;
  CustomTextWidget(
      {super.key,
      this.fSize,
      this.fWeight,
      required this.text,
      this.textColor,
      this.textAlign,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: fSize ?? 14,
        fontWeight: fWeight ?? FontWeight.w400,
        color: textColor ?? Colors.black,
      ),
    );
  }

  animate({required Function(dynamic controller) onPlay}) {}
}
