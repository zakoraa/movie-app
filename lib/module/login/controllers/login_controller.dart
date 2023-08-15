// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/main_page.dart';
import 'package:movieapp/shared/utils/check_form.dart';
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

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    await authController.login(email!.text, password!.text).then((value) {
      if (authController.loginSuccess.value == false) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Your email or password is wrong!");
      } else {
        isLoading.value = false;
        Get.offAll(() => const MainPage());
      }
    });
  }

  Future<void> loginValidation(BuildContext context) async {
    if (email!.text.isEmpty && password!.text.isEmpty) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "You must fill out this form!",
        );
      });
    } else if (email!.text.length < 6) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "Email can't be less than 6 character",
        );
      });
    } else if (password!.text.length < 6) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "Password can't be less than 6 character",
        );
      });
    } else {
      if (email!.text.isNotEmpty && password!.text.isNotEmpty) {
        if (CheckForm.isValidEmail(email!.text)) {
          await login(context);
        } else {
          isLoading.value = true;
          await Future.delayed(const Duration(seconds: 2)).then((value) {
            isLoading.value = false;
            ScaffoldMessengerUtils.showFailedFloatingSnackBar(
              context,
              "Incorrect email format. e.g. : user@example.com",
            );
          });
        }
      }
    }
  }
}
