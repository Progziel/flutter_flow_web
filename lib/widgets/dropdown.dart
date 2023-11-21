import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatefulWidget {
  final String dropDownText;
  final double? width;
  final Color color;
  final List<String> list;
  final ValueChanged<String>? onChanged;

  const CustomDropDown({
    Key? key,
    required this.dropDownText,
    this.width,
    required this.color,
    required this.list,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: CustomTextWidget(
            text: widget.dropDownText,
            textColor: Colors.black45,
            fSize: 16,
            fWeight: FontWeight.w500,
          ),
        ),
        items: widget.list
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: CustomTextWidget(
                      text: item,
                      fSize: 16,
                      fWeight: FontWeight.w500,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        style: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value!);
          }
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: context.width * 0.3,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: widget.color,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: context.width * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
