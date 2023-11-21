import 'package:animations/animations.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/admin/components/payment_history_table.dart';
import 'package:document_management_web/views/admin/users_management.dart';
import 'package:document_management_web/views/dashboard/components/custom_analytics_container.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: AppAssets.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'Overview',
              fSize: 22.0,
              fWeight: FontWeight.w600,
            ),
            Wrap(
              // spacing: 25.0,
              alignment: WrapAlignment.start,
              children: [
                OpenContainer(
                  openColor: Colors.transparent,
                  closedColor: Colors.transparent,
                  transitionDuration: const Duration(milliseconds: 500),
                  closedBuilder: (context, action) =>
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Users',
                          analyticsValue: '21452',
                          analyticsPercentage: '25',
                          icon: Icons.arrow_upward_outlined),
                  openBuilder: (context, action) =>
                      const UserManagementScreen(),

                  openElevation: 0,
                  closedElevation: 0, // Set elevation to 0 to remove the shadow
                  closedShape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(0), // Set border radius to 0
                  ),
                ),
                const CustomAnalyticsContainer(
                    analyticsType: 'Total Balance',
                    analyticsValue: '\$52372',
                    analyticsPercentage: '10',
                    icon: Icons.arrow_upward_outlined),
                const CustomAnalyticsContainer(
                    analyticsType: 'Total Revenue',
                    analyticsValue: '\$9202',
                    analyticsPercentage: '-7',
                    icon: Icons.arrow_downward_outlined),
                const CustomAnalyticsContainer(
                    analyticsType: 'Withdraw',
                    analyticsValue: '\$65726',
                    analyticsPercentage: '-7',
                    icon: Icons.arrow_downward_outlined),
              ],
            ),
            const Divider(color: Colors.grey),
            CustomTextWidget(
              text: 'Transaction History',
              fSize: 18.0,
              fWeight: FontWeight.w600,
            ),
            const SizedBox(height: 15.0),
            const PaymentHistoryTable(),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    ));
  }
}
