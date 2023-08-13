import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';
import 'package:movieapp/module/updateProfile/view/update_profile_view.dart';
import 'package:movieapp/shared/utils/alert_dialog.dart';

class ProfileController extends GetxController {
  AuthController authController = Get.put(AuthController());
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  Future showImageUploadOption(BuildContext context, String idToken) async {
    AlertDialogUtils.showDialogUtils(context,
        title: const Text(
          "Select the option to upload image",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 16,
              fontFamily: "normal"),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              updateProfileController.showCheck.value == true;
              await updateProfileController.openGallery();
              Get.forceAppUpdate();
            },
            child: Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(46, 144, 143, 143),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Row(
                children: const [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.image,
                    size: 25,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Upload From Gallery",
                    style: TextStyle(
                      fontFamily: "normal",
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () => Get.to(() => UpdateProfileView(
                textData: "Profile Picture",
                password: authController.acceptedPassword!,
                idToken: authController.idToken!,
                iconData: Icons.link)),
            child: Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(46, 144, 143, 143),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Row(
                children: const [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.link,
                    size: 25,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Upload From Link Url",
                    style: TextStyle(
                      fontFamily: "normal",
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ]);
  }
}
