import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/firebase/auth_controller.dart';

class LoginController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  RxBool isVisible = false.obs;
  RxBool obscureText = false.obs;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  void visiblePass() {
    isVisible.value = !isVisible.value;
  }

  void loginWithFirebase(BuildContext context, routeName) {
    if (email!.text.isEmpty && password!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          "Your password is empty. Please fill it in!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF535353),
      ));
    } else {
      if (email!.text.isNotEmpty && password!.text.isNotEmpty) {
        if (email!.text.contains("@")) {
          print("email : ${email!.text}");
          print("password : ${password!.text}");
          authController.login(email!.text, password!.text).then((value) {
            print("ini email : ${authController.acceptedEmail}");
            if (authController.acceptedEmail == null) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(seconds: 2),
                content: Text(
                  "Your email or password is wrong!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.amber,
              ));
            } else {
              Get.offAllNamed(routeName);
            }
          });
        }
      }
    }
  }
}
