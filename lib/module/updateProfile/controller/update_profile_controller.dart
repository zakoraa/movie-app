// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/shared/utils/scaffold_messenger.dart';

class UpdateProfileController extends GetxController {
  AuthController authController = Get.put(AuthController());
  HomeController homeController = Get.put(HomeController());
  TextEditingController? textEditingController = TextEditingController();
  RxBool obscureText = false.obs;
  RxBool isLoading = false.obs;
  String? newUsername,
      newEmail,
      newProfilePicture,
      newPassword,
      newIdToken,
      checkEmail;

  Future<void> updateUsername(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
      if (authController.username != textEditingController!.text) {
        await authController
            .updateUsername(idToken, textEditingController!.text)
            .then((value) {
          if (authController.updateSuccess.value == true) {
            newUsername = textEditingController!.text;
            newIdToken = authController.newIdToken;
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFloatingSnackBar(
                context, "Update Username success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFloatingSnackBar(
                context, "Your Update time has expired, please login again!");
            isLoading.value = false;
          }
        });
      } else {
        ScaffoldMessengerUtils.showFloatingSnackBar(
            context, "Username is in use!");
        isLoading.value = false;
      }
    }
  }

  Future<void> updateEmail(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
      if (authController.acceptedEmail != textEditingController!.text) {
        await authController
            .updateEmail(idToken, textEditingController!.text)
            .then((value) {
          if (authController.updateSuccess.value == true) {
            newEmail = textEditingController!.text;
            newIdToken = authController.newIdToken;
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFloatingSnackBar(
                context, "Update email success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFloatingSnackBar(
                context, "Your Update time has expired, please login again!");
            isLoading.value = false;
          }
        });
      } else {
        ScaffoldMessengerUtils.showFloatingSnackBar(
            context, "Email is in use!");
        isLoading.value = false;
      }
    }
  }

  Future<void> updatePassword(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
      if (authController.acceptedPassword != textEditingController!.text) {
        await authController
            .updatePassword(idToken, textEditingController!.text)
            .then((value) {
          if (authController.updateSuccess.value == true) {
            newPassword = textEditingController!.text;
            newIdToken = authController.newIdToken;
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFloatingSnackBar(
                context, "Update Password success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFloatingSnackBar(
                context, "Your Update time has expired, please login again!");
            isLoading.value = false;
          }
        });
      } else {
        ScaffoldMessengerUtils.showFloatingSnackBar(
            context, "Password is in use!");
        isLoading.value = false;
      }
    }
  }

  void updateProfilePicture(BuildContext context, idToken) {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
      authController
          .updateProfilePicture(idToken, textEditingController!.text)
          .then((value) {
        if (authController.updateSuccess.value == true) {
          newIdToken = authController.newIdToken;
          newProfilePicture = textEditingController!.text;
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "Update profile success");
          isLoading.value = false;
        }
        textEditingController!.text = "";
        Get.forceAppUpdate();
      });
    }
  }
}
