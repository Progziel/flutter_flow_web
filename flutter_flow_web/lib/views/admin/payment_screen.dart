import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/admin/components/payment_history_table.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isScreenWide = context.width > 900;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppAssets.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
                text: 'Payment', fSize: 22.0, fWeight: FontWeight.w500),
            const Divider(),
            const SizedBox(height: 15.0),
            Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 20.0,
              runSpacing: 15.0,
              children: [
                UserPlanContainer(),
                PaymentMethodContainer(),
              ],
            ),
            const SizedBox(height: 15.0),
            const Divider(),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                    text: 'Payment History (20)',
                    fSize: 18.0,
                    fWeight: FontWeight.w500),
                CustomButtonWidget(
                  buttonText: 'Download All',
                  onTap: () {},
                )
              ],
            ),
            const SizedBox(height: 15.0),
            const PaymentHistoryTable(),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Column PaymentMethodContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "Payment Method",
          fSize: 16.0,
          fWeight: FontWeight.w500,
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 70,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/paypal.png'),
              const SizedBox(width: 15.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(text: 'james@gmail.com'),
                  CustomTextWidget(
                    text: 'Expiry: 08/12/2025',
                    textColor: Colors.grey,
                    fSize: 12.0,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: CustomTextWidget(
                  text: 'Change',
                  textColor: const Color.fromARGB(255, 7, 95, 167),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Column UserPlanContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: "User's Plan",
          fSize: 16.0,
          fWeight: FontWeight.w500,
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 70,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.radio_button_on_rounded,
                color: Colors.green,
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Yearly Plan',
                    fSize: 16.0,
                  ),
                  CustomTextWidget(text: '\$299.00 USD'),
                ],
              ),
              const Spacer(),
              CustomTextWidget(
                text: 'Next Renue 31st September 2023',
                textColor: Colors.grey,
                fSize: 12.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
