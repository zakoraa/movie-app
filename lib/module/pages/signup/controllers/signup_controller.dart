import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../firebase/auth_controller.dart';

class SignupController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  RxBool isVisible = false.obs;
  RxBool obscureText = false.obs;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();

  void visiblePass() {
    isVisible.value = !isVisible.value;
  }
}
