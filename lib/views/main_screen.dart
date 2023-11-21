import 'package:document_management_web/controller.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/admin/admin_screen.dart';
import 'package:document_management_web/views/compose/compose_screen.dart';
import 'package:document_management_web/views/pricing/pricing_screen.dart';
import 'package:document_management_web/views/reminders/reminder_screen.dart';
import 'package:document_management_web/views/settings/settings.dart';
import 'package:document_management_web/views/templates/templates_screen.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'client/client_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'document/document_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  //final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // bool isMenuTapped = false;
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  late MyGeneralController controller;

  @override
  void initState() {
    controller = Get.put(MyGeneralController());
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/app-logo.png',
                  height: 220,
                  width: context.width * 0.2,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                const Icon(Icons.notifications, color: Colors.white),
                const SizedBox(width: 15.0),
                const Icon(Icons.account_circle_rounded, color: Colors.white),
                const SizedBox(width: 15.0),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SideMenu(
                  // footer: StorageIndicator(),
                  collapseWidth: 100,
                  controller: sideMenu,
                  // title: SideMenuDisplayMode.compact == true ?  CustomButtonWidget(
                  //   buttonText: 'New Request',
                  //   onTap: () {},
                  //   buttonColor: AppAssets.backgroundColor,
                  // ),
                  style: SideMenuStyle(
                    openSideMenuWidth: context.width * 0.2,
                    itemBorderRadius: BorderRadius.circular(12.0),
                    toggleColor: Colors.white,
                    itemOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                    compactSideMenuWidth: 70,
                    backgroundColor: Colors.transparent,
                    itemInnerSpacing: 10.0,
                    displayMode: SideMenuDisplayMode.compact,
                    showTooltip: true,
                    iconSize: 26,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    )),
                    hoverColor: Colors.white.withOpacity(0.1),
                    selectedHoverColor: AppAssets.primaryColor,
                    selectedColor: AppAssets.primaryColor,
                    unselectedIconColor: Colors.white70,
                    selectedTitleTextStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    unselectedTitleTextStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                    selectedIconColor: Colors.white,
                  ),
                  showToggle: true,
                  items: [
                    SideMenuItem(
                      title: 'Dashboard',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      // iconWidget: Image.asset('assets/images/menu.png', height: 25),
                      icon: const Icon(Icons.home_filled),
                      badgeContent: const Text(
                        '3',
                        style: TextStyle(color: Colors.white),
                      ),
                      tooltipContent: "Dashboard",
                    ),
                    SideMenuItem(
                      title: 'New Request',
                      // trailing: IconButton(
                      //   icon: const Icon(
                      //     Icons.arrow_drop_down_rounded,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {
                      //     const CustomDropDown(
                      //         dropDownText: '', color: Colors.white, list: []);
                      //   },
                      // ),
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.description),
                    ),
                    SideMenuItem(
                      title: 'Lead Form',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.file_copy_rounded),
                    ),
                    SideMenuItem(
                      title: 'Templates',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.edit_document),
                    ),
                    SideMenuItem(
                      title: 'Client',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.person_2),
                    ),
                    SideMenuItem(
                      title: 'Admin',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.person_2),
                    ),
                    SideMenuItem(
                      title: 'Reminders',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.notifications),
                    ),
                    SideMenuItem(
                      title: 'Pricing',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.attach_money_rounded),
                    ),
                    SideMenuItem(
                      title: 'Settings',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.settings),
                    ),
                    // SideMenuItem(
                    //   title: 'Logout',
                    //   onTap: (index, _) {
                    //     Get.to(const LoginScreen(),
                    //         transition: Transition.fadeIn);
                    //   },
                    //   icon: const Icon(Icons.logout),
                    // ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: const [
                      DashboardScreen(),
                      NewRequestScreen(),
                      DocumentScreen(),
                      TemplateScreen(),
                      ClientScreen(),
                      AdminScreen(),
                      ReminderScreen(),
                      PricingScreen(),
                      Settings(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  CircularPercentIndicator StorageIndicator() {
    return CircularPercentIndicator(
      backgroundColor: Colors.red,
      radius: 70.0,
      lineWidth: 10.0,
      animation: true,
      percent: 0.7,
      center: CustomTextWidget(
        text: '70%',
        textColor: Colors.white,
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CustomTextWidget(
          text: 'Storage',
          textColor: Colors.white,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.square,
      progressColor: Colors.white,
    );
  }
}
