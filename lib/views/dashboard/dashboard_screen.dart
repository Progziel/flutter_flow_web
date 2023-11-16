// ignore_for_file: non_constant_identifier_names

import 'package:animations/animations.dart';
import 'package:document_management_web/models/charts_model.dart';
import 'package:document_management_web/models/user_model.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/dashboard/components/custom_analytics_container.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<ChartData> data;

  //late TooltipBehavior _tooltip;

  final List<PieChartData> chartData = [
    PieChartData('David', 100),
    PieChartData('Steve', 110),
    PieChartData('Jack', 320),
    PieChartData('Others', 830)
  ];
  late List<ChartData> _chartData;

  @override
  void initState() {
    _chartData = <ChartData>[
      ChartData('Request Dynamics', 55, 40, 45, 48),
      ChartData('Reminder Analysis', 33, 45, 54, 28),
      ChartData('Template Trends', 43, 23, 20, 34),
      ChartData('Client Interactions', 32, 54, 23, 54),
      ChartData('Storage Metrics', 56, 18, 43, 55),
      ChartData('User Subscriptions', 23, 54, 33, 56),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppAssets.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(16.0))),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                LayoutBuilder(
                    builder: (context, boxContraints) => Wrap(
                          spacing: 10.0,
                          children: [
                            PieChart(boxContraints.maxWidth * 0.2),
                            _buildStackedLine100Chart(
                                boxContraints.maxWidth * 0.50),
                            RadialBar(boxContraints.maxWidth * 0.2),
                          ],
                        )),
                const Divider(),
                SizedBox(
                  child: Wrap(
                    children: [
                      OpenContainer(
                        openColor: Colors.transparent,
                        closedColor: Colors.transparent,
                        transitionDuration: const Duration(milliseconds: 500),
                        closedBuilder: (context, action) =>
                            const CustomAnalyticsContainer(
                                analyticsType: 'Total Users',
                                analyticsValue: '42',
                                analyticsPercentage: '10',
                                icon: Icons.arrow_upward_outlined),
                        openBuilder: (context, action) {
                          return Scaffold(
                            appBar: AppBar(),
                            body: UsersList(),
                          );
                        },
                        openElevation: 0,
                        closedElevation:
                            0, // Set elevation to 0 to remove the shadow
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Set border radius to 0
                        ),
                      ),
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Documents',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Completed',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Recieved',
                          analyticsValue: '12',
                          analyticsPercentage: '33',
                          icon: Icons.arrow_upward_outlined),
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Archieve',
                          analyticsValue: '452',
                          analyticsPercentage: '25',
                          icon: Icons.arrow_upward_outlined),
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Users',
                          analyticsValue: '42',
                          analyticsPercentage: '10',
                          icon: Icons.arrow_upward_outlined),
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Documents',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                      const CustomAnalyticsContainer(
                          analyticsType: 'Total Completed',
                          analyticsValue: '26',
                          analyticsPercentage: '-7',
                          icon: Icons.arrow_downward_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Padding UsersList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: 'Users',
                fSize: 22.0,
                fWeight: FontWeight.w700,
              ),
              CustomButtonWidget(
                buttonText: 'Add User',
                onTap: () {
                  _addUserDialog(context);
                },
              )
            ],
          ),
          Expanded(
            child: Container(
              //height: 400,
              color: Colors.white30,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Column(
                    children: [
                      Card(
                        elevation: 10.0,
                        child: ExpansionTile(
                          leading: const Icon(Icons.person_2_rounded),
                          collapsedBackgroundColor: Colors.grey.shade200,
                          backgroundColor: Colors.white,
                          title: CustomTextWidget(
                            text: user.name,
                            fSize: 16.0,
                            fWeight: FontWeight.w700,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(text: user.email),
                              CustomTextWidget(text: user.number),
                            ],
                          ),
                          children: [
                            Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButtonWidget(
                                    buttonText: 'Edit',
                                    onTap: () {},
                                  ),
                                  CustomButtonWidget(
                                    buttonText: 'Delete',
                                    buttonColor: Colors.red,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container RadialBar(double width) {
    return Container(
      height: context.height * 0.4,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SizedBox(
          height: 100,
          child: SfCircularChart(series: <CircularSeries>[
            RadialBarSeries<PieChartData, String>(
                enableTooltip: true,
                dataSource: chartData,
                xValueMapper: (PieChartData data, _) => data.x,
                yValueMapper: (PieChartData data, _) => data.y)
          ])),
    );
  }

  Container PieChart(double width) {
    return Container(
      height: context.height * 0.4,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SizedBox(
        height: 100,
        child: SfCircularChart(series: <CircularSeries>[
          PieSeries<PieChartData, String>(
            dataSource: chartData,
            pointColorMapper: (PieChartData data, _) => data.color,
            xValueMapper: (PieChartData data, _) => data.x,
            yValueMapper: (PieChartData data, _) => data.y,
          ),
        ]),
      ),
    );
  }

  /// Returns the cartesian stacked line 100 chart.
  Container _buildStackedLine100Chart(double width) {
    return Container(
      height: context.height * 0.4,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'Document Management System - User Analysis'),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelRotation: -45,
        ),
        primaryYAxis: NumericAxis(
            rangePadding: ChartRangePadding.none,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getStackedLine100Series(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  /// Returns the list of char series
  /// which need to render on the stacked line 100 chart.
  List<ChartSeries<ChartData, String>> _getStackedLine100Series() {
    return <ChartSeries<ChartData, String>>[
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.father,
          name: 'Client 1',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.mother,
          name: 'Client 2',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.son,
          name: 'Client 3',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.daughter,
          name: 'Client 4',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }

  void _addUserDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: CustomTextWidget(
              text: 'Add User',
              fSize: 18.0,
              fWeight: FontWeight.w700,
            ),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Name',
                controller: nameController,
                fillColor: Colors.white,
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                fillColor: Colors.white,
              ),
              const SizedBox(height: 10.0),
              CustomTextField(
                hintText: 'Number',
                controller: numberController,
                fillColor: Colors.white,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                  buttonText: 'Cancel',
                  buttonColor: Colors.red,
                  onTap: () {},
                ),
                CustomButtonWidget(
                  buttonText: 'Add User',
                  onTap: () {
                    setState(() {
                      users.add(
                        UserModel(
                          name: nameController.text,
                          email: emailController.text,
                          number: numberController.text.toString(),
                        ),
                      );
                    });
                    Get.back();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
