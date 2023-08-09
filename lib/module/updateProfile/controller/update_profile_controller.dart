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
  String? newUsername, newEmail, newProfilePicture, newPassword, newIdToken;

  Future<void> updateUsername(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
      authController
          .updateUsername(idToken, textEditingController!.text)
          .then((value) {
        if (authController.updateSuccess.value == true) {
          newIdToken = authController.newIdToken;
          newUsername = textEditingController!.text;
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "Update username success");
          isLoading.value = false;
        }
        isLoading.value = false;
        textEditingController!.text = "";
        Get.forceAppUpdate();
      });
    }
  }

  Future<void> updateEmail(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
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
              context, "Your Update time has expired, please login again");
          isLoading.value = false;
          Get.forceAppUpdate();
        }
      });
    }
  }

 Future <void> updatePassword(BuildContext context, idToken) async{
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
      await authController
          .updatePassword(idToken, textEditingController!.text)
          .then((value) {
        if (authController.updateSuccess.value == true) {
          newPassword = textEditingController!.text;
          newIdToken = authController.newIdToken;
          textEditingController!.text = "";
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "Update password success");
          isLoading.value = false;
          Get.forceAppUpdate();
        } else {
          textEditingController!.text = "";
          ScaffoldMessengerUtils.showFloatingSnackBar(
              context, "Your Update time has expired, please login again");
          isLoading.value = false;
          Get.forceAppUpdate();
        }
      });
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
              context, "Update username success");
          isLoading.value = false;
        }
        textEditingController!.text = "";
        Get.forceAppUpdate();
      });
    }
  }
}
