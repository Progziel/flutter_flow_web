import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:document_management_web/utilities/constants.dart';
import 'package:document_management_web/views/auth/login_screen.dart';
import 'package:document_management_web/widgets/custom_button.dart';
import 'package:document_management_web/widgets/custom_text_widget.dart';
import 'package:document_management_web/widgets/custom_texxtfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: context.isLandscape
          ? Row(
              children: [
                Expanded(flex: 2, child: _logo()),
                Expanded(child: _signUp()),
              ],
            )
          : Column(
              children: [
                Expanded(child: _logo()),
                Expanded(flex: 2, child: _signUp()),
              ],
            ),
    );
  }

  Widget _logo() {
    return Container(
      color: AppAssets.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Craft Your Personalized  Document Workflow',
                    fSize: 26.0,
                    fWeight: FontWeight.w700,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Securely Access your Personalized Workspace',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TyperAnimatedText(
                        'Manage Document Requests and set Reminders',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TyperAnimatedText(
                        'Experience Seamless Collaboration',
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              Image.asset('assets/images/loginpage.png')
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUp() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app-logo.png',
                //  width: 300,
              ),
              CustomTextField(
                hintText: 'Name',
                controller: TextEditingController(),
                fillColor: Colors.white,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Email',
                controller: TextEditingController(),
                fillColor: Colors.white,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Number',
                controller: TextEditingController(),
                fillColor: Colors.white,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Password',
                controller: TextEditingController(),
                fillColor: Colors.white,
              ),
              const SizedBox(height: 10.0),
              CustomButtonWidget(
                buttonText: 'Register',
                onTap: () {},
              ),
              InkWell(
                onTap: () {
                  Get.to(const LoginScreen(), transition: Transition.fadeIn);
                },
                child: RichText(
                  text: TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Already have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        text: ' Login',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
