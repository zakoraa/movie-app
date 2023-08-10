import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/widgets/drawer/container_drawer.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';

import '../../../../shared/widgets/profile_picture_widget.dart';
import '../../../auth/auth_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
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
                "assets/Ellipse 2.png",
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
                      color: Color(0xFFFFB039),
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
                          authController.username == null ||
                                  authController.username! == ""
                              ? ""
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
                profilePicture: authController.profilePicture == null ||
                        authController.profilePicture == ""
                    ? 'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg'
                    : authController.profilePicture,
                username: authController.username == null ||
                        authController.username == ""
                    ? ""
                    : authController.username!,
                email: authController.acceptedEmail == null ||
                        authController.acceptedEmail == ""
                    ? ""
                    : authController.acceptedEmail!,
                password: authController.acceptedPassword == null ||
                        authController.acceptedPassword == ""
                    ? ""
                    : authController.acceptedPassword!,
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
