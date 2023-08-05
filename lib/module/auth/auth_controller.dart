// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:movieapp/services/auth_service.dart';

class AuthController extends GetxController {
  AuthService authService = Get.put(AuthService());

  String? acceptedEmail;
  RxBool emailDuplication = false.obs;
  String? username;
  String? profilePicture;

  Future<void> login(String email, String password) async {
    try {
      var data = await authService.login(email, password);
      if (data.keys.toString() == '(error)') {
        acceptedEmail = null;
      } else {
        acceptedEmail = data["email"];
        username = data["displayName"];
        profilePicture = data["profilePicture"];
      }
      print("data : ${data}");
      print("idToken: ${data["idToken"]}");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signup(String username, String email, String password) async {
    try {
      var data = await authService.signup(username, email, password);
      if (data.keys.toString() == '(error)') {
        emailDuplication.value = true;
      } else {
        emailDuplication.value = false;
      }
      print("data : ${data}");
    } catch (e) {
      print(e.toString());
    }
  }
}
