// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/login/controllers/login_controller.dart';
import 'package:movieapp/module/signup/view/signup_view.dart';
import 'package:movieapp/shared/widgets/button_widget.dart';
import '../../../shared/widgets/form_login_signup.dart';
import '../../../shared/widgets/textfield_widget.dart';
import 'package:lottie/lottie.dart';

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
                  "WELCOME BACK 👋",
                  style: TextStyle(fontSize: 28),
                ),
                const SizedBox(
                  height: 40.0,
                ),
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
                  height: 40.0,
                ),
                ButtonWidget(
                    fontSize: 16,
                    width: Get.size.width * 0.75,
                    height: 50,
                    text: "Login",
                    onTap: () => loginController.loginValidation(context),
                    controller: loginController),
                const SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () => Get.to(() => const SignupView(),
                      transition: Transition.fadeIn),
                  child: const Text(
                    "Don't have an account?",
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
    ));
  }
}
