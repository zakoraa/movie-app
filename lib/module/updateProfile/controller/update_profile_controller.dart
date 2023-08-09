import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/shared/utils/scaffold_messenger.dart';

class UpdateProfileController extends GetxController {
  AuthController authController = Get.put(AuthController());
  HomeController homeController = Get.put(HomeController());
  TextEditingController? username = TextEditingController();
  RxBool obscureText = false.obs;
  RxBool isLoading = false.obs;
  String? newUsername;

  void updateUsername(BuildContext context, idToken) {
    if (username!.text == "") {
      ScaffoldMessengerUtils.showFloatingSnackBar(
          context, "You must fill out this form!");
    } else {
      isLoading.value = true;
      authController.updateUsername(idToken, username!.text).then((value) {
        newUsername = username!.text;
        username!.text = "";
        Get.forceAppUpdate();
        isLoading.value = false;
        ScaffoldMessengerUtils.showFloatingSnackBar(
            context, "Update username success");
      });
    }
  }
}
