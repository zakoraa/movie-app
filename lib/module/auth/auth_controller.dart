// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movieapp/services/auth_service.dart';

class AuthController extends GetxController {
  AuthService authService = Get.put(AuthService());
  final GetStorage storage = GetStorage();

  String? acceptedEmail,
      username,
      acceptedPassword,
      idToken,
      newIdToken,
      userId;
  RxBool emailDuplication = false.obs;
  RxBool loginSuccess = false.obs;
  String acceptedProfilePicture = "";

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
        acceptedProfilePicture = savedProfilePicture;
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      var data = await authService.login(email, password);
      acceptedPassword = authService.acceptedPassword!;
      if (data.keys.toString() == '(error)') {
        loginSuccess.value = false;
      } else {
        loginSuccess.value = true;
        userId = data["localId"];
        acceptedEmail = data["email"];
        username = data["displayName"];
        acceptedProfilePicture = data["profilePicture"] ?? "";
        idToken = data["idToken"];
      }
      print("data: ${data}");
      print("idToken: ${data["idToken"]}");
      print("movieId: ${data["movieId"]}");
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
}
