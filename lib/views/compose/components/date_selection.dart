import 'package:document_management_web/models/template_model.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DueDateAndRemindersForm extends StatefulWidget {
  const DueDateAndRemindersForm({Key? key}) : super(key: key);

  @override
  _DueDateAndRemindersFormState createState() =>
      _DueDateAndRemindersFormState();
}

class _DueDateAndRemindersFormState extends State<DueDateAndRemindersForm> {
  DueDateAndRemindersModel? dueDateAndReminders;
  List<DateTime> selectedReminderDates = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: context.height * 0.5,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, border: Border.all(color: Colors.black)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.isLandscape
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dueDateColumn(),
                      _dueDateButton(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dueDateColumn(),
                      _dueDateButton(),
                    ],
                  ),
            const Divider(
              thickness: 2,
            ),
            context.isLandscape
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _reminderColumn(),
                      _reminderButton(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _reminderColumn(),
                      _reminderButton(),
                    ],
                  ),
            selectedReminderDates.isNotEmpty
                ? Center(
                    child: Column(
                      children: List.generate(
                        selectedReminderDates.length,
                        (index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              elevation: 5.0,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CustomTextWidget(
                                  text:
                                      'Reminder ${(index + 1)} at ${selectedReminderDates[index].day.toString()}-${selectedReminderDates[index].month.toString()}-${selectedReminderDates[index].year.toString()}',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.width * 0.3,
                              child: const CustomTextField(
                                  hintText: 'Enter message',
                                  fillColor: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(child: CustomTextWidget(text: 'No reminder selected')),
          ],
        ),
      ),
    );
  }

  Column _reminderColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'Reminder Dates',
          fSize: 16.0,
          fWeight: FontWeight.w700,
        ),
        CustomTextWidget(
          text:
              'The Client will get reminders through\n email and phone number on the dates\n you will select below.',
          fSize: 12.0,
          fWeight: FontWeight.w400,
          maxLines: 5,
        ),
      ],
    );
  }

  Column _dueDateColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'Due Date',
          fSize: 16.0,
          fWeight: FontWeight.w700,
        ),
        dueDateAndReminders?.dueDate != null
            ? CustomTextWidget(
                text:
                    'The due date for sending the documents is ${dueDateAndReminders!.dueDate!.day.toString()}-${dueDateAndReminders!.dueDate!.month.toString()}-${dueDateAndReminders!.dueDate!.year.toString()}',
                maxLines: 3,
              )
            : CustomTextWidget(text: 'No Due Date selected'),
      ],
    );
  }

  CustomButtonWidget _reminderButton() {
    return CustomButtonWidget(
        width: 200,
        buttonText: 'Select Reminders Date',
        onTap: _selectReminderDate);
  }

  CustomButtonWidget _dueDateButton() {
    return CustomButtonWidget(
        width: 140, buttonText: 'Select Due Date', onTap: _selectDueDate);
  }

  Future<void> _selectDueDate() async {
    final pickedDueDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDueDate != null) {
      setState(() {
        dueDateAndReminders = DueDateAndRemindersModel(
          dueDate: pickedDueDate,
          reminders: [],
        );
      });
    }
  }

  Future<void> _selectReminderDate() async {
    final pickedReminderDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedReminderDate != null) {
      setState(() {
        selectedReminderDates.add(pickedReminderDate);
      });
    }
  }
}
