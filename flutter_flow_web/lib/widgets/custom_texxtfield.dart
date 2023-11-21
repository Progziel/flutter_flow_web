import 'package:flutter/material.dart';

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
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      controller: controller,
      decoration: InputDecoration(
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
