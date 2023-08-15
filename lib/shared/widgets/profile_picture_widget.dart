import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';

import 'detail_profile_picture.dart';

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
    String? newImageUrl = updateProfileController.newProfilePictureUrl;
    File? newImageGallery = updateProfileController.newProfilePictureGallery;

    // bool
    bool isImageAdded = authController.acceptedProfilePicture !=
        ""; // If account already have image
    bool isImageGalleryUpdated =
        newImageGallery != null; // if image gallery is updated
    bool isImageUrlUpdated = newImageUrl != null; // if image url is updated
    bool isImageGallery = isImageGalleryUpdated
        ? true
        : isImageAdded
            ? authController.acceptedProfilePicture.split("'").length == 3
            : false; // if image is gallery

    // dynamic
    dynamic imageGallery = isImageGalleryUpdated
        ? newImageGallery
        : isImageGallery == false
            ? ""
            : File(isImageAdded
                ? authController.acceptedProfilePicture.split("'")[1]
                : ""); // if image gallery is updated , show newImage

    dynamic imageUrl = isImageUrlUpdated
        ? newImageUrl
        : authController.acceptedProfilePicture
            .toString(); // if image url is updated, show newImage
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
                  imageUrl != "" &&
                          !isImageGallery &&
                          imageGallery == "" &&
                          !isImageGalleryUpdated
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                  imageGallery != ""
                      ? Image.file(
                          imageGallery,
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
