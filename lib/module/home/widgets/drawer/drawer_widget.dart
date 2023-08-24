// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/widgets/drawer/container_drawer.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';
import 'package:movieapp/module/user/user_controller.dart';
import 'package:movieapp/shared/theme/colors.dart';

import '../../../../shared/widgets/profile_picture_widget.dart';
import '../../../auth/auth_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    UserController userController = Get.put(UserController());
    UpdateProfileController updateProfileController =
        Get.put(UpdateProfileController());
    return Drawer(
      backgroundColor: const Color(0xFF2C2C2C),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/Ellipse 2.png",
                scale: 1,
              )),
          Column(
            children: [
              DrawerHeader(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    height: 40,
                    width: Get.size.width,
                    decoration: const BoxDecoration(
                      color: CustomColor.secondaryBgColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ProfilePictureWidget(
                          size: 100,
                          tag: "Drawer",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          updateProfileController.newUsername != null
                              ? updateProfileController.newUsername!
                              : authController.username!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              ContainerDrawer(
                profilePicture: authController.acceptedProfilePicture == ""
                    ? 'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg'
                    : authController.acceptedProfilePicture,
                username: updateProfileController.newUsername != null
                    ? updateProfileController.newUsername!
                    : authController.username,
                email: updateProfileController.newEmail != null
                    ? updateProfileController.newEmail!
                    : authController.acceptedEmail,
                password: updateProfileController.newPassword != null
                    ? updateProfileController.newPassword!
                    : authController.acceptedPassword,
                idToken: authController.idToken == null ||
                        authController.idToken == ""
                    ? ""
                    : authController.idToken!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
