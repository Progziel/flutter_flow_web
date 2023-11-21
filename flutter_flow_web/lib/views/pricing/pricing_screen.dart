import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppAssets.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25.0),
                CustomTextWidget(
                  text:
                      'Flexible Pricing Plans Tailored for Your Document Management Needs',
                  fSize: 22.0,
                  fWeight: FontWeight.w700,
                  maxLines: 5,
                ),
                const SizedBox(height: 15.0),
                CustomTextWidget(
                  text:
                      'Discover our thoughtfully crafted pricing options designed to accommodate businesses of all sizes. Choose a plan that aligns with your document management requirements, ensuring seamless organization, accessibility, and collaboration.',
                  fSize: 14.0,
                  fWeight: FontWeight.w400,
                  maxLines: 15,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15.0),
                const Wrap(
                  children: [
                    CustomPricingWidget(
                      title: 'Simple. Affordable',
                      price: 9.99,
                      subscription: ' per month',
                      discount: 0,
                      hasDiscount: false,
                    ),
                    CustomPricingWidget(
                      title: 'Yearly Savings',
                      price: 107.89,
                      subscription: ' per year',
                      discount: 10,
                      hasDiscount: true,
                    ),
                    CustomPricingWidget(
                      title: 'Team Discounts',
                      price: 97.10,
                      subscription: ' per year',
                      discount: 10,
                      hasDiscount: true,
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                CustomTextWidget(
                  text: 'Try for free',
                  fSize: 22.0,
                  fWeight: FontWeight.w700,
                ),
                const SizedBox(height: 15.0),
                CustomTextWidget(
                  text:
                      'Free trial: 3 requests, all features. Experience seamless document management—organize, collaborate, and ensure accessibility for your workflow.',
                  fSize: 14.0,
                  fWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
                const SizedBox(height: 15.0),
                CustomButtonWidget(
                  width: 200,
                  buttonText: 'Get Started',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPricingWidget extends StatelessWidget {
  final String title;
  final double price;
  final String subscription;
  final double discount;
  final bool? hasDiscount;

  const CustomPricingWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.subscription,
    required this.discount,
    this.hasDiscount = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: Get.height * 0.35,
        width: 250,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasDiscount == false
                ? const SizedBox(height: 30.0)
                : const SizedBox(height: 0.0),
            Visibility(
              visible: hasDiscount == true,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: Colors.green, // or any color you prefer
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                    ),
                  ),
                  child: CustomTextWidget(
                    text: '$discount% OFF',
                    fSize: 12.0,
                    textColor: Colors.white,
                    fWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            //  const SizedBox(height: 10.0),
            CustomTextWidget(
              text: title,
              fSize: 20.0,
              fWeight: FontWeight.w600,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\$',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '$price',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: subscription,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
              buttonText: 'Get Started',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
