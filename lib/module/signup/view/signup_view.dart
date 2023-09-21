import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/signup/controllers/signup_controller.dart';
import 'package:movieapp/shared/widgets/button_widget.dart';
import 'package:movieapp/shared/widgets/form_login_signup.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/widgets/textfield_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return FormLoginSignup(
      content: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: SizedBox(
              width: Get.size.width,
              child: Column(
                children: [
                  Lottie.asset("assets/lottie/login.json",
                      repeat: true, fit: BoxFit.contain),
                  const Text(
                    "WELCOME 👋",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFieldWidget(
                      selectedController: signupController,
                      controller: signupController.username,
                      text: "Username",
                      icon: Icons.person),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFieldWidget(
                      selectedController: signupController,
                      controller: signupController.email,
                      text: "Email",
                      icon: Icons.email),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFieldWidget(
                    selectedController: signupController,
                    controller: signupController.password,
                    text: "Password",
                    icon: Icons.key,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFieldWidget(
                    confirmPass: true,
                    controller: signupController.confirmPassword,
                    text: "Confirm Your Password",
                    icon: Icons.key,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ButtonWidget(
                      width: Get.size.width * 0.75,
                      height: 40,
                      fontSize: 14,
                      onTap: () => signupController.signupValidation(context),
                      controller: signupController,
                      text: "Signup"),
                  const SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: "normal",
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
