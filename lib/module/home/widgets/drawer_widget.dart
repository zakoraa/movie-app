import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/widgets/container_drawer.dart';
import 'package:movieapp/module/home/widgets/detail_profile_picture.dart';

import '../../auth/auth_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
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
                        GestureDetector(
                          onTap: () => Get.to(
                              () => const DetailProfilePicture(),
                              opaque: false,
                              fullscreenDialog: true,
                              transition: Transition.circularReveal),
                          child: Hero(
                            tag: "imageDrawerTag",
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    authController.profilePicture == null ||
                                            authController.profilePicture == ""
                                        ? 'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg'
                                        : authController.profilePicture!,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          authController.username == null ||
                                  authController.username! == ""
                              ? authController.acceptedEmail!
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
              const ContainerDrawer(),
            ],
          ),
        ],
      ),
    );
  }
}
