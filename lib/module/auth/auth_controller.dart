// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movieapp/services/auth_service.dart';

class AuthController extends GetxController {
  AuthService authService = Get.put(AuthService());
  final GetStorage storage = GetStorage();

  String? acceptedEmail,
      username,
      profilePicture,
      acceptedPassword,
      idToken,
      newIdToken;
  RxBool emailDuplication = false.obs;
  RxBool updateSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool isLoggedIn = storage.read('isLoggedIn') ?? false;

    if (isLoggedIn) {
      String? savedUsername = storage.read('username');
      String? savedProfilePicture = storage.read('profilePicture');

      if (savedUsername != null) {
        username = savedUsername;
      }

      if (savedProfilePicture != null) {
        profilePicture = savedProfilePicture;
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      var data = await authService.login(email, password);
      acceptedPassword = authService.acceptedPassword!;
      if (data.keys.toString() == '(error)') {
        acceptedEmail = null;
      } else {
        acceptedEmail = data["email"];
        username = data["displayName"];
        profilePicture = data["profilePicture"];
        idToken = data["idToken"];
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
      }
      print("data : ${data}");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateUsername(String idToken, String username) async {
    try {
      var data = await authService.updateUsername(idToken, username);
      this.username = data["displayName"];
      if (data.keys.toString() != '(error)') {
        updateSuccess.value = true;
      } else {
        emailDuplication.value = false;
      }
      print("username : ${this.username}");
      print("data : ${data}");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateEmail(String idToken, String email) async {
    try {
      var data = await authService.updateEmail(idToken, email);
      acceptedEmail = data["email"];
      if (data.keys.toString() != '(error)') {
        newIdToken = data["idToken"];
      print("newIdTokenAUTHSUCCESS : ${newIdToken}");
        updateSuccess.value = true;
        emailDuplication.value = true;
      } else {
      print("newIdTokenAUTHFAIL : ${data["idToken"]}");
        updateSuccess.value = false;
        emailDuplication.value = false;
      }
      // print("email : ${acceptedEmail}");
      print("data : ${data}");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatePassword(String idToken, String password) async {
    try {
      var data = await authService.updatePassword(idToken, password);
      acceptedPassword = data["password"];
      if (data.keys.toString() != '(error)') {
        newIdToken = data["idToken"];
        updateSuccess.value = true;
      }
      print("password : ${acceptedPassword}");
      print("data : ${data}");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateProfilePicture(
      String idToken, String profilePicture) async {
    try {
      var data =
          await authService.updateProfilePicture(idToken, profilePicture);
      this.profilePicture = data["profilePicture"];
      if (data.keys.toString() != '(error)') {
        newIdToken = data["idToken"];
        updateSuccess.value = true;
      }
      print("profilePicture : ${profilePicture}");
      print("data : ${data}");
    } catch (e) {
      print(e.toString());
    }
  }
}
