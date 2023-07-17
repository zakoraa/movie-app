import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isVisible = false.obs;
  RxBool obscureText = false.obs;

  void visiblePass() {
    isVisible.value = !isVisible.value;
  }
}
