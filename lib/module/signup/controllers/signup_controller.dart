// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';

import '../../../shared/utils/scaffold_messenger.dart';

class SignupController extends GetxController {
  AuthController authController = Get.put(AuthController());

  RxBool passwordIsVisible = true.obs;
  RxBool confirmPasswordIsVisible = true.obs;
  RxBool obscureText = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController? username = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? confirmPassword = TextEditingController();

  void visiblePass() {
    passwordIsVisible.value = !passwordIsVisible.value;
  }

  void visibleConfirmPass() {
    confirmPasswordIsVisible.value = !confirmPasswordIsVisible.value;
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  void signup(context) {
    isLoading.value = true;
    authController
        .signup(username!.text, email!.text, password!.text)
        .then((value) {
      if (authController.emailDuplication.value == false) {
        isLoading.value = false;
        Get.back();
        username!.text = "";
        email!.text = "";
        password!.text = "";
        confirmPassword!.text = "";
        ScaffoldMessengerUtils.showFloatingSnackBar(context, "Signup success");
      } else {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFloatingSnackBar(
            context, "Email already exists");
      }
    });
  }

  void signupValidation(BuildContext context) {
    if (email!.text.isEmpty ||
        password!.text.isEmpty ||
        username!.text.isEmpty ||
        confirmPassword!.text.isEmpty) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else if (email!.text.length < 6) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "Email can't be less than 6 character");
    } else if (password!.text.length < 6) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "Password can't be less than 6 character");
    } else if (password!.text != confirmPassword!.text) {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "Password and confirm password must be the same!");
    } else {
      if (email!.text.isNotEmpty && password!.text.isNotEmpty) {
        if (isValidEmail(email!.text)) {
          print("username : ${username!.text}");
          print("email : ${email!.text}");
          print("password : ${password!.text}");
          signup(context);
        } else {
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "Incorrect email format. e.g. : user@example.com");
        }
      }
    }
  }
}
