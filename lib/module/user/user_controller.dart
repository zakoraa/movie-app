// ignore_for_file: avoid_print

import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movieapp/services/user_service.dart';

class UserController {
  UserService userService = Get.put(UserService());
  final GetStorage storage = GetStorage();

  String? acceptedEmail, username, acceptedPassword, idToken, newIdToken;
  RxBool emailDuplication = false.obs;
  RxBool updateSuccess = false.obs;
  String acceptedProfilePicture = "";
  Future<void> updateUsername(String idToken, String username) async {
    try {
      var data = await userService.updateUsername(idToken, username);
      this.username = data["displayName"];
      if (data.keys.toString() != '(error)') {
        updateSuccess.value = true;
      } else {
        emailDuplication.value = false;
      }
      print("username : ${this.username}");
      print("data : $data");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateEmail(String idToken, String email) async {
    try {
      var data = await userService.updateEmail(idToken, email);
      acceptedEmail = data["email"];
      if (data.keys.toString() != '(error)') {
        newIdToken = data["idToken"];
        print("newIdTokenAUTHSUCCESS : $newIdToken");
        updateSuccess.value = true;
        emailDuplication.value = true;
      } else {
        print("newIdTokenAUTHFAIL : ${data["idToken"]}");
        updateSuccess.value = false;
        emailDuplication.value = false;
      }
      print("email : $acceptedEmail");
      print("data : $data");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatePassword(String idToken, String password) async {
    try {
      var data = await userService.updatePassword(idToken, password);
      acceptedPassword = data["password"];
      if (data.keys.toString() != '(error)') {
        newIdToken = data["idToken"];
        updateSuccess.value = true;
      }
      print("password : $acceptedPassword");
      print("data : $data");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateProfilePictureWUrl(
      String idToken, String profilePicture) async {
    try {
      var data =
          await userService.updateProfilePictureWUrl(idToken, profilePicture);
      if (data.keys.toString() != '(error)') {
        acceptedProfilePicture = data["profilePicture"] ?? "";
        newIdToken = data["idToken"];
        updateSuccess.value = true;
      }
      print("success :${updateSuccess.value}");
      print("profilePicture : $profilePicture");
      print("data : $data");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateProfilePictureWGallery(
      String idToken, File profilePicture) async {
    try {
      var data = await userService.updateProfilePictureWGallery(
          idToken, profilePicture);
      if (data.keys.toString() != '(error)') {
        acceptedProfilePicture = data["profilePicture"] ?? "";
        newIdToken = data["idToken"];
        updateSuccess.value = true;
      }
      print("profilePicture : $profilePicture");
      print("data : $data");
    } catch (e) {
      print(e.toString());
    }
  }
}
