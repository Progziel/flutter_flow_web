import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/compose/components/stepper_widget.dart';
import 'package:flutter/material.dart';

class NewRequestScreen extends StatelessWidget {
  const NewRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppAssets.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0))),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: StepperWidget(),
        ),
      ),
    );
  }
}
