import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../auth/auth_controller.dart';

class SignupController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  RxBool passwordIsVisible = true.obs;
  RxBool confirmPasswordIsVisible = true.obs;
  RxBool obscureText = false.obs;
  TextEditingController? username = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? confirmPassword = TextEditingController();

  void visiblePass() {
    passwordIsVisible.value = !passwordIsVisible.value;
  }
  void visibleConfirmPass() {
    confirmPasswordIsVisible.value = !confirmPasswordIsVisible.value;
  }
}
