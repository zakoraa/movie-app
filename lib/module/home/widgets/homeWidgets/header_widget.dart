// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/search/view/search_view.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';
import 'package:movieapp/module/user/user_controller.dart';
import 'package:movieapp/shared/widgets/profile_picture_widget.dart';

import '../../../auth/auth_controller.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    UserController userController = Get.put(UserController());
    UpdateProfileController updateProfileController =
        Get.put(UpdateProfileController());
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: SizedBox(
        width: Get.size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (() => Scaffold.of(context).openDrawer()),
                  child: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => const SearchView(),
                      transition: Transition.rightToLeftWithFade),
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Text(userController.username == null ||
                              userController.username! == ""
                          ? "Hi ${authController.username}"
                          : "Hi ${userController.username!}"),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "See Whats new Today",
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                          fontSize: 12),
                    )
                  ],
                ),
                const ProfilePictureWidget(size: 65, tag: "Home")
              ],
            )
          ],
        ),
      ),
    );
  }
}
