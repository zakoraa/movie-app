import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';

import '../../module/home/widgets/homeWidgets/detail_profile_picture.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget(
      {super.key, required this.size, required this.tag});

  final double size;
  final String tag;

  @override
  Widget build(BuildContext context) {
    UpdateProfileController updateProfileController =
        Get.put(UpdateProfileController());
    AuthController authController = Get.put(AuthController());
    return GestureDetector(
      onTap: () => Get.to(() => const DetailProfilePicture(),
          opaque: false,
          fullscreenDialog: true,
          transition: Transition.circularReveal),
      child: Hero(
        tag: tag,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(size),
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(size)),
              child: updateProfileController.newProfilePictureUrl == null && updateProfileController.newProfilePictureGallery != null
                  ? Image.file(
                      updateProfileController.newProfilePictureGallery!,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
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
    );
  }
}
