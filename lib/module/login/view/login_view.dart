// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/module/login/controllers/login_controller.dart';
import 'package:movieapp/module/signup/view/signup_view.dart';
import 'package:movieapp/shared/theme/colors.dart';
import 'package:movieapp/shared/widgets/button_widget.dart';
import '../../../shared/widgets/form_login_signup.dart';
import '../../../shared/widgets/textfield_widget.dart';
// import 'package:lottie/lottie.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    TextEditingController? email;
    TextEditingController? password;
    return FormLoginSignup(
        content: SizedBox(
      height: Get.size.height,
      width: Get.size.width,
      child: Center(
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          SizedBox(
            width: Get.size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Zako",
                        style: GoogleFonts.lobster(
                            fontSize: 70, fontWeight: FontWeight.w100),
                      ),
                      TextSpan(
                        text: "RA",
                        style: GoogleFonts.lobster(
                            fontSize: 70,
                            fontWeight: FontWeight.w100,
                            color: CustomColor.secondaryBgColor),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFieldWidget(
                          selectedController: loginController,
                          controller: loginController.email,
                          text: "Email",
                          icon: Icons.email),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFieldWidget(
                        selectedController: loginController,
                        controller: loginController.password,
                        text: "Password",
                        icon: Icons.key,
                        suffixIcon: true,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      ButtonWidget(
                          fontSize: 16,
                          width: Get.width * 0.80,
                          height: 48,
                          text: "Login",
                          onTap: () => loginController.loginValidation(context),
                          controller: loginController),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "normal",
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => const SignupView(),
                                transition: Transition.fadeIn),
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "normal",
                                  color: CustomColor.yellow,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
