import 'package:document_management_web/models/reminder_model.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final List<Reminder> reminders = List.generate(15, (index) {
    // Generating dynamic dates (e.g., '2023-11-15', '2023-11-16', etc.)
    String date = '${index + 1} - 10 - 2023';
    return Reminder(date: date, email: 'james@gmail.com');
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppAssets.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          child: context.isLandscape
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: leftContainer(),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(child: rightContainer()),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      leftContainer(),
                      rightContainer(),
                    ],
                  ),
                )),
    );
  }

  Container rightContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppAssets.backgroundColor,
        borderRadius: const BorderRadius.only(
            // topRight: Radius.circular(16.0),
            // bottomRight: Radius.circular(16.0),
            ),
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'Reminders Activity',
              fSize: 16.0,
              fWeight: FontWeight.w700,
            ),
            const SizedBox(height: 15.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return TimelineTile(
                  alignment: TimelineAlign.start,
                  indicatorStyle: const IndicatorStyle(
                    width: 10,
                    color: Colors.black,
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Reminder sent to ${reminders[index].email}',
                          maxLines: 4,
                          fSize: 14.0,
                        ),
                        CustomTextWidget(
                          text: 'Date: ${reminders[index].date}',
                          maxLines: 4,
                          fSize: 12.0,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container leftContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppAssets.backgroundColor,
        borderRadius: const BorderRadius.only(
            // topLeft: Radius.circular(16.0),
            // bottomLeft: Radius.circular(16.0),
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: 'Reminder Schedule',
            fSize: 22.0,
          ),
          CustomTextWidget(
            text:
                'The reminder time  is where you define exactly how the system will follow up on your invoices with your customers.',
            fSize: 14.0,
            maxLines: 7,
          ),
          const SizedBox(height: 20.0),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  height: 120,
                  width: 180,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: 'Email Reminder',
                        fSize: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  height: 120,
                  width: 180,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: 'Phone Number Reminder',
                        fSize: 16.0,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
