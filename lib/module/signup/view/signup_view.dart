import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/signup/controllers/signup_controller.dart';
import 'package:movieapp/shared/widgets/button_widget.dart';
import 'package:movieapp/shared/widgets/form_login_signup.dart';

import '../../../shared/widgets/textfield_widget.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return FormLoginSignup(
        content: Positioned(
      bottom: 0,
      child: Container(
        height: Get.size.height * 0.8,
        width: Get.size.width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(126, 71, 51, 21),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: Get.size.width,
              child: Column(
                children: [
                  const Text(
                    "WELCOME",
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
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
