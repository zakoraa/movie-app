import 'package:flutter/material.dart';

abstract class CustomColor {
  static const primaryBgColor = Color(0xFF2C2C2C);
  static const secondaryBgColor = Color(0xFFFFB039);
  static const textColor = Color(0xFFFFFFFF);
}

// String? newImageUrl = updateProfileController.newProfilePictureUrl;
//     File? newImageGallery = updateProfileController.newProfilePictureGallery;

//     // boolean
//     bool isImageAdded = authController.acceptedProfilePicture != "";
//     bool isNewImageGallery = newImageGallery != null;
//     bool isImageGallery = isNewImageGallery
//         ? true
//         : isImageAdded
//             ? authController.acceptedProfilePicture.split("'").length == 3
//             : false;
//     bool isImageGalleryUpdated =
//         updateProfileController.newProfilePictureGallery != null;
//     bool isImageUrlUpdated =
//         updateProfileController.newProfilePictureUrl != null;
//     dynamic imageGallery = isNewImageGallery
//         ? true
//         : isImageGallery == false
//             ? null
//             : File(isImageAdded
//                 ? authController.acceptedProfilePicture.split("'")[1]
//                 : "");