// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/module/user/user_controller.dart';
import 'package:movieapp/shared/utils/check_form.dart';
import 'package:movieapp/shared/utils/scaffold_messenger.dart';

class UpdateProfileController extends GetxController {
  UserController userController = Get.put(UserController());
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
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "You must fill out this form!",
        );
      });
    } else {
      isLoading.value = true;
      if (userController.username != textEditingController!.text) {
        await userController
            .updateUsername(idToken, textEditingController!.text)
            .then((value) {
          if (userController.updateSuccess.value == true) {
            newUsername = textEditingController!.text;
            newIdToken = userController.newIdToken;
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                context, "Update Username success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            isLoading.value = true;
            Future.delayed(const Duration(seconds: 2)).then((value) {
              isLoading.value = false;
              ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                context,
                "Your Update time has expired, please login again!",
              );
            });
          }
        });
      } else {
        isLoading.value = true;
        await Future.delayed(const Duration(seconds: 2)).then((value) {
          isLoading.value = false;
          ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context,
            "Username is in use!",
          );
        });
      }
    }
  }

  Future<void> updateEmail(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "You must fill out this form!",
        );
      });
    } else if (textEditingController!.text.isNotEmpty &&
        textEditingController!.text.length < 6) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "Profile picture must be more than 6 characters!",
        );
      });
    } else {
      isLoading.value = true;
      if (CheckForm.isValidEmail(textEditingController!.text)) {
        if (userController.acceptedEmail != textEditingController!.text) {
          await userController
              .updateEmail(idToken, textEditingController!.text)
              .then((value) {
            if (userController.updateSuccess.value == true) {
              newEmail = textEditingController!.text;
              newIdToken = userController.newIdToken;
              textEditingController!.text = "";
              ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                  context, "Update email success");
              isLoading.value = false;
              Get.forceAppUpdate();
            } else {
              textEditingController!.text = "";
              isLoading.value = true;
              Future.delayed(const Duration(seconds: 2)).then((value) {
                isLoading.value = false;
                ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                  context,
                  "Your Update time has expired, please login again!",
                );
              });
            }
          });
        } else {
          isLoading.value = true;
          await Future.delayed(const Duration(seconds: 2)).then((value) {
            isLoading.value = false;
            ScaffoldMessengerUtils.showFailedFloatingSnackBar(
              context,
              "Email is in use!",
            );
          });
        }
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

  Future<void> updatePassword(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "You must fill out this form!",
        );
      });
    } else if (textEditingController!.text.isNotEmpty &&
        textEditingController!.text.length < 6) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "Profile picture must be more than 6 characters!",
        );
      });
    } else {
      isLoading.value = true;
      if (userController.acceptedPassword != textEditingController!.text) {
        await userController
            .updatePassword(idToken, textEditingController!.text)
            .then((value) {
          if (userController.updateSuccess.value == true) {
            newPassword = textEditingController!.text;
            newIdToken = userController.newIdToken;
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                context, "Update Password success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            isLoading.value = true;
            Future.delayed(const Duration(seconds: 2)).then((value) {
              isLoading.value = false;
              ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                context,
                "Your Update time has expired, please login again!",
              );
            });
          }
        });
      } else {
        isLoading.value = true;
        await Future.delayed(const Duration(seconds: 2)).then((value) {
          isLoading.value = false;
          ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context,
            "Password is in use!",
          );
        });
      }
    }
  }

  Future<void> updateProfilePictureWUrl(BuildContext context, idToken) async {
    if (textEditingController!.text == "") {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "You must fill out this form!",
        );
      });
    } else if (textEditingController!.text.isNotEmpty &&
        textEditingController!.text.length < 10) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
          context,
          "Profile picture must be more than 10 characters!",
        );
      });
    } else if (CheckForm.isImageUrl(textEditingController)) {
      isLoading.value = true;
      if (userController.acceptedProfilePicture !=
          textEditingController!.text) {
        await userController
            .updateProfilePictureWUrl(idToken, textEditingController!.text)
            .then((value) {
          print("ATUH UPDATE : ${userController.updateSuccess.value}");
          if (userController.updateSuccess.value == true) {
            newProfilePictureUrl = textEditingController!.text;
            newProfilePictureGallery = null;
            newIdToken = userController.newIdToken;
            textEditingController!.text = "";
            ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
                context, "Update ProfilePicture Success");
            isLoading.value = false;
            Get.forceAppUpdate();
          } else {
            textEditingController!.text = "";
            isLoading.value = true;
            Future.delayed(const Duration(seconds: 2)).then((value) {
              isLoading.value = false;
              ScaffoldMessengerUtils.showFailedFloatingSnackBar(
                  context, "Your Update time has expired, please login again!");
            });
          }
        });
      } else {
        isLoading.value = true;
        isLoading.value = true;
        await Future.delayed(const Duration(seconds: 2)).then((value) {
          isLoading.value = false;
          ScaffoldMessengerUtils.showFailedFloatingSnackBar(
              context, "Profile Picture is in use!");
        });
      }
    } else {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading.value = false;
        ScaffoldMessengerUtils.showFailedFloatingSnackBar(
            context, "Url link format  must end with .jpg .jpeg or .png!");
      });
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

  Future updateProfilePictureWGallery(
      BuildContext context, String idToken) async {
    print(imageGallery);
    if (imageGallery == null) {
      return;
    } else {
      newProfilePictureUrl = null;
      newProfilePictureGallery = File(imageGallery.path);
      isSavedImage.value = true;
      if (showCheck.value == true) {
        isLoading.value = true;
        await userController
            .updateProfilePictureWGallery(idToken, newProfilePictureGallery!)
            .then((value) {
          isLoading.value = false;
          ScaffoldMessengerUtils.showSuccessedFloatingSnackBar(
              context, "Update ProfilePicture Success");
          showCheck.value = false;
          Get.forceAppUpdate();
        });
      }
    }
  }
}
