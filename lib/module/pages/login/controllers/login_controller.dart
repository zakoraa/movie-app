// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/firebase/auth_controller.dart';
import 'package:movieapp/utils/scaffold_messenger.dart';

class LoginController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  RxBool passwordIsVisible = true.obs;
  RxBool obscureText = false.obs;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  void visiblePass() {
    passwordIsVisible.value = !passwordIsVisible.value;
  }

  void loginWithFirebase(BuildContext context, routeName) {
    if (email!.text.isEmpty && password!.text.isEmpty) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "Your email and password are empty. Please fill it in!");
    }
    else if (email!.text.isEmpty) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "Your email is empty. Please fill it in!");
    } else if (password!.text.isEmpty) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "Your password is empty. Please fill it in!");
    } else {
      if (email!.text.isNotEmpty && password!.text.isNotEmpty) {
        if (email!.text.contains("@")) {
          print("email : ${email!.text}");
          print("password : ${password!.text}");
          authController.login(email!.text, password!.text).then((value) {
            print("accepted email : ${authController.acceptedEmail}");
            if (authController.acceptedEmail == null) {
              ScaffoldMessengerUtils.showFloatingSnackBar(
                  context, "Your email or password is wrong!");
            } else {
              Get.offAllNamed(routeName);
            }
          });
        } else {
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "email must contain @");
        }
      }
    }
  }
}
