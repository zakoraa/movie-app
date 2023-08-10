import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';

class DetailProfilePicture extends StatelessWidget {
  const DetailProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    UpdateProfileController updateProfileController =
        Get.put(UpdateProfileController());
    return GestureDetector(
      onTap: () => Get.back(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Hero(
            tag: "image",
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(250)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(250),
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.network(
                        updateProfileController.newProfilePictureUrl != null
                            ? updateProfileController.newProfilePictureUrl!
                            : authController.profilePicture == null ||
                                    authController.profilePicture == ""
                                ? 'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg'
                                : authController.profilePicture!,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
