import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';

class DetailProfilePicture extends StatelessWidget {
  const DetailProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return GestureDetector(
      onTap: () => Get.back(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Hero(
            tag: "image",
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(250),
                  child: SizedBox(
                    height: 250,
                    width: 250,
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
        ),
      ),
    );
  }
}
