import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import 'detail_profile_picture.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
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
                const Icon(
                  Icons.search,
                  size: 30,
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
                    Text(authController.username == null ||
                            authController.username! == ""
                        ? "Hi"
                        : "Hi ${authController.username!}"),
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
                GestureDetector(
                  onTap: () => Get.to(() => const DetailProfilePicture(),
                      opaque: false,
                      fullscreenDialog: true,
                      transition: Transition.circularReveal),
                  child: Hero(
                    tag: "imageTag",
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                          height: 65,
                          width: 65,
                          child: Image.network(
                            authController.profilePicture == null ||
                                    authController.profilePicture == ""
                                ? 'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg'
                                : authController.profilePicture!,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
