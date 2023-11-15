import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Color fillColor;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      controller: controller,
      decoration: InputDecoration(
        // constraints: BoxConstraints(maxWidth: context.width * 0.3),
        filled: true,
        fillColor: fillColor,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Focused border color
        ),
        hintText: hintText,
      ),
    );
  }
}
