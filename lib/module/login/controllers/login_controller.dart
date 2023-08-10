// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/main_page.dart';
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

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  void login(BuildContext context) {
    isLoading.value = true;
    authController.login(email!.text, password!.text).then((value) {
      print("accepted email : ${authController.acceptedEmail}");
      if (authController.acceptedEmail == null) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Your email or password is wrong!");
      } else {
        isLoading.value = false;
        Get.offAll(() => const MainPage());
      }
    });
  }

  void loginValidation(BuildContext context) {
    if (email!.text.isEmpty && password!.text.isEmpty) {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context, "You must fill out this form!");
    } else if (email!.text.length < 6) {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context, "Email can't be less than 6 character");
    } else if (password!.text.length < 6) {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context, "Password can't be less than 6 character");
    } else {
      if (email!.text.isNotEmpty && password!.text.isNotEmpty) {
        if (isValidEmail(email!.text)) {
          print("email : ${email!.text}");
          print("password : ${password!.text}");
          login(context);
        } else {
          ScaffoldMessengerUtils.showFailedFloatingSnackBar(
              context, "Incorrect email format. e.g. : user@example.com");
        }
      }
    }
  }
}
