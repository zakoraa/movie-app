import 'dart:io';

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
    bool isImageAdded = authController.acceptedProfilePicture != "" ||
        authController.acceptedProfilePicture != null;
    String? newImageUrl = updateProfileController.newProfilePictureUrl;
    File? newImageGallery = updateProfileController.newProfilePictureGallery;
    bool isImageGallery = newImageGallery != null
        ? true
        : isImageAdded
            ? authController.acceptedProfilePicture.split("'").length == 3
            : false;
    bool isImageGalleryUpdated =
        updateProfileController.newProfilePictureGallery != null;
    bool isImageUrlUpdated =
        updateProfileController.newProfilePictureUrl != null;
    dynamic imageGallery = newImageGallery != null
        ? true
        : isImageGallery == false
            ? null
            : File(isImageAdded
                ? authController.acceptedProfilePicture.split("'")[1]
                : "");
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg',
                    fit: BoxFit.cover,
                  ),
                  !isImageGallery &&
                          isImageAdded &&
                          imageGallery == null &&
                          !isImageGalleryUpdated
                      ? Image.network(
                          isImageUrlUpdated
                              ? newImageUrl!
                              : authController.acceptedProfilePicture
                                  .toString(),
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                  isImageAdded && imageGallery != null
                      ? Image.file(
                          isImageGalleryUpdated
                              ? newImageGallery
                              : imageGallery,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            )),
      ),
    );
  }
}

// YEEEE WALAUPUN CODE SAYA SANGAT TIDAK CLEAN!!!
