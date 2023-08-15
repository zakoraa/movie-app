import 'dart:io';
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
            ),
          ),
        ),
      ),
    );
  }
}
