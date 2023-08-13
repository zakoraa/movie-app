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
    bool isImageAdded = authController.acceptedProfilePicture != "";
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
            ),
          ),
        ),
      ),
    );
  }
}
