// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/main_page.dart';
import 'package:movieapp/services/auth_service.dart';
import 'package:movieapp/shared/utils/scaffold_messenger.dart';

class LoginController extends GetxController {
  AuthController authController = Get.put(AuthController());
  RxBool passwordIsVisible = true.obs;
  RxBool obscureText = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  void visiblePass() {
    passwordIsVisible.value = !passwordIsVisible.value;
  }

  void login(BuildContext context) {
      isLoading.value = true;
      authController.login(email!.text, password!.text).then((value) {
        print("accepted email : ${authController.acceptedEmail}");
        if (authController.acceptedEmail == null) {
          isLoading.value = false;
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "Your email or password is wrong!");
        } else {
          isLoading.value = false;
          Get.offAll(() => const MainPage());
        }
      });
    }

  void loginValidation(BuildContext context) {
    if (email!.text.isEmpty && password!.text.isEmpty) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "Your email and password are empty. Please fill it in!");
    } else if (email!.text.isEmpty) {
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
          login(context);
        } else {
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "email must contain @");
        }
      }
    }  
  }
}
