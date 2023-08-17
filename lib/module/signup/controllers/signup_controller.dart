// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/user/user_controller.dart';
import 'package:movieapp/shared/utils/check_form.dart';
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

  UserController userController = Get.put(UserController());

  void visiblePass() {
    passwordIsVisible.value = !passwordIsVisible.value;
  }

  void visibleConfirmPass() {
    confirmPasswordIsVisible.value = !confirmPasswordIsVisible.value;
  }

  Future<void> signup(context) async {
    isLoading.value = true;
    // if (authController.emailDuplication.value == false) {
    //   print("email txt : ${email!.text}");
    //   await userController.addUserToDb(email!.text);
    // }
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
        ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
            context, "Signup success");
      } else {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Email already exists");
      }
    });
  }

  Future<void> signupValidation(BuildContext context) async {
    if (email!.text.isEmpty ||
        password!.text.isEmpty ||
        username!.text.isEmpty ||
        confirmPassword!.text.isEmpty) {
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
    } else if (password!.text != confirmPassword!.text) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "Password and Confirm Password must be the same!",
        );
      });
    } else {
      if (email!.text.isNotEmpty && password!.text.isNotEmpty) {
        if (CheckForm.isValidEmail(email!.text)) {
          print("username : ${username!.text}");
          print("email : ${email!.text}");
          print("password : ${password!.text}");
          await signup(context);
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
