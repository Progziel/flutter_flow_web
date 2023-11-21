import 'package:document_management_web/models/admin_model.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/admin/payment_screen.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  List<AdminModel> admins = [
    AdminModel(
      name: "ABC Corporation",
      joinedDate: DateTime(2023, 9, 10),
      subscription: 'Monthly',
      isSubscriptionPaid: true,
    ),
    AdminModel(
      name: "XYZ Ltd.",
      joinedDate: DateTime(2023, 8, 15),
      subscription: 'Monthly',
      isSubscriptionPaid: false,
    ),
    AdminModel(
      name: "Tech Innovators Inc.",
      joinedDate: DateTime(2023, 7, 20),
      subscription: 'Monthly',
      isSubscriptionPaid: true,
    ),
    // Add 10 more admins below
    AdminModel(
      name: "New Vision Enterprises",
      joinedDate: DateTime(2023, 10, 5),
      subscription: 'Monthly',
      isSubscriptionPaid: false,
    ),
    AdminModel(
      name: "Data Dynamics Ltd.",
      joinedDate: DateTime(2023, 11, 15),
      subscription: 'Monthly',
      isSubscriptionPaid: true,
    ),
    AdminModel(
      name: "Innovate Solutions Co.",
      joinedDate: DateTime(2023, 10, 1),
      subscription: 'Monthly',
      isSubscriptionPaid: false,
    ),
    AdminModel(
      name: "Eagle Tech Group",
      joinedDate: DateTime(2023, 11, 25),
      subscription: 'Monthly',
      isSubscriptionPaid: true,
    ),
    AdminModel(
      name: "Future Trends Inc.",
      joinedDate: DateTime(2023, 12, 10),
      subscription: 'Monthly',
      isSubscriptionPaid: false,
    ),
    AdminModel(
      name: "Strategic Visionaries Ltd.",
      joinedDate: DateTime(2023, 11, 5),
      subscription: 'Monthly',
      isSubscriptionPaid: true,
    ),
    AdminModel(
      name: "Smart Data Solutions",
      joinedDate: DateTime(2023, 12, 1),
      subscription: 'Monthly',
      isSubscriptionPaid: false,
    ),
    AdminModel(
      name: "Global Innovators Co.",
      joinedDate: DateTime(2023, 10, 15),
      subscription: 'Monthly',
      isSubscriptionPaid: true,
    ),
    AdminModel(
      name: "Tech Masters Inc.",
      joinedDate: DateTime(2023, 12, 15),
      subscription: 'Monthly',
      isSubscriptionPaid: false,
    ),
  ];

  AdminModel? selectedAdmin;

  void selectAdmin(AdminModel admin) {
    setState(() {
      selectedAdmin = admin;
    });
  }

  void removeAdmin(AdminModel admin) {
    setState(() {
      admins.remove(admin);
      selectedAdmin = null;
    });
  }

  void editAdminName(AdminModel admin, String newName) {
    setState(() {
      admin.name = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          decoration: BoxDecoration(
              color: AppAssets.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(16.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ListView(children: [
              CustomTextWidget(
                  text: 'Admin Dashboard', fSize: 20, fWeight: FontWeight.w600),
              const Divider(thickness: 2, color: Colors.grey),
              const SizedBox(height: 10),
              LeftContainer(
                  admins: admins,
                  selectedAdmin: selectedAdmin,
                  onSelect: selectAdmin),
              SizedBox(width: 10.0),
              if (selectedAdmin != null)
                RightContainer(
                    admin: selectedAdmin!,
                    onRemove: removeAdmin,
                    onEditName: editAdminName),
              if (selectedAdmin == null && admins.isNotEmpty)
                RightContainer(
                    admin: admins[0],
                    onRemove: removeAdmin,
                    onEditName: editAdminName),
              if (selectedAdmin == null && admins.isEmpty)
                Expanded(
                    flex: 3,
                    child: Container(
                        height: Get.height * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: CustomTextWidget(
                              text: 'No User found',
                              fSize: 14,
                              fWeight: FontWeight.w400),
                        )))
            ]),
          )),
    );
  }
}

class RightContainer extends StatelessWidget {
  final AdminModel admin;
  final void Function(AdminModel admin) onRemove;
  final void Function(AdminModel admin, String newName) onEditName;

  const RightContainer({
    super.key,
    required this.admin,
    required this.onRemove,
    required this.onEditName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: context.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserDetails(context),
                const SizedBox(height: 10.0),
                Container(
                  height: context.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              text: 'Subscription',
                              fSize: 22,
                              fWeight: FontWeight.w500,
                            ),
                            CustomButtonWidget(
                              buttonText: 'View Payment History',
                              onTap: () {
                                Get.to(const PaymentScreen());
                              },
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CustomTextWidget(
                                  text: 'Subscription plan',
                                  fSize: 14,
                                  fWeight: FontWeight.w500,
                                ),
                                CustomTextWidget(
                                  text: '\$9.99/Monthly',
                                  fSize: 14,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CustomTextWidget(
                                  text: 'Status',
                                  fSize: 14,
                                  fWeight: FontWeight.w500,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: const BoxDecoration(
                                    color:
                                        Colors.green, // or any color you prefer
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomTextWidget(
                                      text: 'Active',
                                      fSize: 12.0,
                                      textColor: Colors.white,
                                      fWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CustomTextWidget(
                                  text: 'Start Date',
                                  fSize: 14,
                                  fWeight: FontWeight.w500,
                                ),
                                CustomTextWidget(
                                  text: '01-12-2023',
                                  fSize: 14,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CustomTextWidget(
                                  text: 'Renewal Date',
                                  fSize: 14,
                                  fWeight: FontWeight.w500,
                                ),
                                CustomTextWidget(
                                  text: '31-12-2023',
                                  fSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CircularPercentIndicator(
                              backgroundColor: Colors.red,
                              // arcBackgroundColor: Colors.red,
                              // arcType: ArcType.FULL,
                              radius: 70.0,
                              lineWidth: 12.0,
                              animation: true,
                              percent: 0.2,
                              center: CustomTextWidget(
                                text: '80%',
                                textColor: Colors.black,
                              ),
                              footer: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: CustomTextWidget(
                                  text: 'Storage Used',
                                  textColor: Colors.black,
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.square,
                              progressColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container UserDetails(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: admin.name,
                    fSize: 22,
                    fWeight: FontWeight.w700,
                  ),
                  CustomTextWidget(
                    text: 'Subscription type: ${admin.subscription}',
                    fSize: 12,
                    fWeight: FontWeight.w500,
                  ),
                  CustomTextWidget(
                    text:
                        'Joined Dashboard : ${admin.joinedDate.day}/${admin.joinedDate.month}/${admin.joinedDate.year}',
                    fSize: 12,
                    fWeight: FontWeight.w500,
                  ),
                  CustomTextWidget(
                    text:
                        'Subscription paid: ${admin.isSubscriptionPaid ? 'yes' : 'no'}',
                    fSize: 12,
                    fWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 12,
              children: [
                CustomButtonWidget(
                  buttonText: 'Remove',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: CustomTextWidget(
                              text: "Confirm Removal",
                              fWeight: FontWeight.w700,
                              fSize: 16),
                          content: CustomTextWidget(
                              text:
                                  "Are you sure you want to remove this User?"),
                          actions: <Widget>[
                            CustomButtonWidget(
                              buttonText: 'Cancel',
                              onTap: () {},
                              buttonColor: AppAssets.primaryColor,
                              textColor: Colors.white,
                            ),
                            CustomButtonWidget(
                              buttonText: 'Remove',
                              onTap: () {
                                onRemove(admin);
                                Navigator.of(context).pop();

                                const snackBar = SnackBar(
                                    duration: Duration(seconds: 1),
                                    content:
                                        Text('User removed successfully.'));

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              buttonColor: Colors.red,
                              textColor: Colors.white,
                            ),
                          ],
                        );
                      },
                    );
                  },
                  buttonColor: Colors.red,
                  textColor: Colors.white,
                ),
                CustomButtonWidget(
                  buttonText: 'Edit',
                  onTap: () {
                    _showEditDialog(context);
                  },
                  buttonColor: const Color.fromARGB(255, 20, 96, 158),
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: CustomTextWidget(
            text: "Edit User Information",
            fSize: 18,
            fWeight: FontWeight.w700,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 40,
              ),
              TextFormField(
                onChanged: (value) {},
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  hintText: 'Name',
                ),
              ),
              TextFormField(
                onChanged: (value) {},
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  hintText: 'Phone Number',
                ),
              ),
              TextFormField(
                onChanged: (value) {},
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  hintText: 'Date of Birth',
                ),
              ),
              TextFormField(
                onChanged: (value) {},
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  hintText: 'Email',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: CustomTextWidget(
                text: "Cancel",
                fSize: 15,
                fWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: CustomTextWidget(
                text: "Save",
                fSize: 15,
                fWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}

class LeftContainer extends StatefulWidget {
  const LeftContainer({
    required this.admins,
    required this.selectedAdmin,
    required this.onSelect,
    Key? key,
  }) : super(key: key);

  final List<AdminModel> admins;
  final AdminModel? selectedAdmin;
  final void Function(AdminModel admin) onSelect;

  @override
  _LeftContainerState createState() => _LeftContainerState();
}

class _LeftContainerState extends State<LeftContainer> {
  final TextEditingController _searchController = TextEditingController();
  List<AdminModel> _filteredAdmins = [];

  @override
  void initState() {
    super.initState();
    _filteredAdmins = widget.admins; // Initialize with all admins
  }

  void _filterAdmins(String query) {
    setState(() {
      _filteredAdmins = widget.admins.where((admin) {
        final adminName = admin.name.toLowerCase();
        final lowerQuery = query.toLowerCase();
        return adminName.contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: context.height * 0.75,
        width: context.width * 0.25,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterAdmins,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 15,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search by name',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_filteredAdmins.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _filteredAdmins.length,
                    itemBuilder: (context, index) {
                      final admin = _filteredAdmins[index];
                      final isSelected = admin == widget.selectedAdmin;
                      return GestureDetector(
                        onTap: () => widget.onSelect(admin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: admin.name,
                              fSize: 16,
                              fWeight: FontWeight.w500,
                              textColor: isSelected
                                  ? Colors.red
                                  : Colors
                                      .black, // Change color based on selection
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    },
                  ),
                )
              else
                Expanded(
                  child: Center(
                    child: CustomTextWidget(
                      text: 'No Admins found',
                      fSize: 14,
                      fWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
