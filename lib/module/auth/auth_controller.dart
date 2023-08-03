// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:movieapp/services/auth_service.dart';

class AuthController extends GetxController {
  AuthService authService = Get.put(AuthService());

  String? acceptedEmail;
  String? username;
  String? profilePicture;

  Future<void> login(String email, String password) async {
    try {
      var data = await authService.login(email, password);
      if (data.keys == '(error)') {
        acceptedEmail = null;
      } else {
        acceptedEmail = data["email"];
        username = data["displayName"];
        profilePicture = data["profilePicture"];
        print("pp : ${profilePicture}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
