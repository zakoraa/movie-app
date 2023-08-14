// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/shared/utils/check_form.dart';
import 'package:movieapp/shared/utils/scaffold_messenger.dart';

class UpdateProfileController extends GetxController {
  AuthController authController = Get.put(AuthController());
  HomeController homeController = Get.put(HomeController());
  TextEditingController? textEditingController = TextEditingController();
  File? selectedImageGallery;
  RxBool obscureText = false.obs;
  RxBool isLoading = false.obs;
  String? newUsername,
      newEmail,
      newProfilePictureUrl,
      newPassword,
      newIdToken,
      checkEmail;
  File? newProfilePictureGallery;
  File? temporaryProfilePictureGallery;
  RxBool isSavedImage = false.obs;
  RxBool showCheck = false.obs;
  var imageGallery;

  Future<void> updateUsername(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
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
            ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                context, "Update Username success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                context, "Your Update time has expired, please login again!");
            isLoading.value = false;
          }
        });
      } else {
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Username is in use!");
        isLoading.value = false;
      }
    }
  }

  Future<void> updateEmail(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context, "You must fill out this form!");
    } else if (textEditingController!.text.isNotEmpty &&
        textEditingController!.text.length < 6) {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
        context,
        "Profile picture must be more than 6 characters!",
      );
    } else {
      isLoading.value = true;
      if (CheckForm.isValidEmail(textEditingController!.text)) {
        if (authController.acceptedEmail != textEditingController!.text) {
          await authController
              .updateEmail(idToken, textEditingController!.text)
              .then((value) {
            if (authController.updateSuccess.value == true) {
              newEmail = textEditingController!.text;
              newIdToken = authController.newIdToken;
              textEditingController!.text = "";
              ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                  context, "Update email success");
              isLoading.value = false;
              Get.forceAppUpdate();
            } else {
              textEditingController!.text = "";
              ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                  context, "Your Update time has expired, please login again!");
              isLoading.value = false;
            }
          });
        } else {
          ScaffoldMessengerUtils.showFailedFloatingSnackBar(
              context, "Email is in use!");
          isLoading.value = false;
        }
      } else {
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Incorrect email format. e.g. : user@example.com");
        isLoading.value = false;
      }
    }
  }

  Future<void> updatePassword(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context, "You must fill out this form!");
    } else if (textEditingController!.text.isNotEmpty &&
        textEditingController!.text.length < 6) {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
        context,
        "Profile picture must be more than 6 characters!",
      );
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
            ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                context, "Update Password success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                context, "Your Update time has expired, please login again!");
            isLoading.value = false;
          }
        });
      } else {
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Password is in use!");
        isLoading.value = false;
      }
    }
  }

  Future<void> updateProfilePictureWUrl(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context, "You must fill out this form!");
    } else if (textEditingController!.text.isNotEmpty &&
        textEditingController!.text.length < 10) {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
        context,
        "Profile picture must be more than 10 characters!",
      );
    } else if (CheckForm.isImageUrl(textEditingController)) {
      isLoading.value = true;
      if (authController.acceptedProfilePicture !=
          textEditingController!.text) {
        await authController
            .updateProfilePictureWUrl(idToken, textEditingController!.text)
            .then((value) {
          print("ATUH UPDATE : ${authController.updateSuccess.value}");
          if (authController.updateSuccess.value == true) {
            newProfilePictureUrl = textEditingController!.text;
            newProfilePictureGallery = null;
            newIdToken = authController.newIdToken;
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                context, "Update ProfilePicture success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                context, "Your Update time has expired, please login again!");
            isLoading.value = false;
          }
        });
      } else {
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Profile Picture is in use!");
        isLoading.value = false;
      }
    } else {
      ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context, "Url link format  must end with .jpg .jpeg or .png!");
      isLoading.value = false;
    }
  }

  Future openGallery() async {
    showCheck.value = true;
    imageGallery = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery == null) {
      return;
    }
    newProfilePictureGallery = File(imageGallery.path);
    print(newProfilePictureGallery);
  }

  Future updateProfilePictureWGallery(String idToken) async {
    print(imageGallery);
    if (imageGallery == null) {
      return;
    } else {
      newProfilePictureUrl = null;
      newProfilePictureGallery = File(imageGallery.path);
      isSavedImage.value = true;
      if (showCheck.value == true) {
        await authController
            .updateProfilePictureWGallery(idToken, newProfilePictureGallery!)
            .then((value) {
          showCheck.value = false;
          Get.forceAppUpdate();
        });
      }
    }
  }
}
