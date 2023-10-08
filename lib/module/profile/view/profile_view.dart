import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/profile/controller/profile_controller.dart';
import 'package:movieapp/module/updateProfile/view/update_profile_view.dart';
import 'package:movieapp/shared/theme/colors.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
import 'package:movieapp/shared/widgets/app_bar_custom.dart';
import 'package:movieapp/shared/widgets/profile_picture_widget.dart';

import '../../updateProfile/controller/update_profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(
      {super.key,
      required this.profilePicture,
      required this.username,
      required this.email,
      required this.idToken,
      required this.password});

  final String profilePicture, username, email, password, idToken;

  @override
  Widget build(BuildContext context) {
    ProfileController controller =
        Get.put(ProfileController(), permanent: true);
    UpdateProfileController updateProfileController =
        Get.put(UpdateProfileController());
    Map<String, dynamic> settingOptions = {
      "Username": Icons.person,
      "Email": Icons.email,
      "Password": Icons.key,
    };

    List<String> userInfo = [
      updateProfileController.newUsername != null
          ? updateProfileController.newUsername!
          : username,
      updateProfileController.newEmail != null
          ? updateProfileController.newEmail!
          : email,
      "********"
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: ScaffoldBackgroundTemplate(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 140),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Stack(children: [
                        const ProfilePictureWidget(size: 150, tag: "Profile"),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => controller.showImageUploadOption(
                                  context,
                                  updateProfileController.newIdToken == null
                                      ? idToken
                                      : updateProfileController.newIdToken!),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: CustomColor.secondaryBgColor,
                                    borderRadius: BorderRadius.circular(40)),
                                child: const Center(
                                  child: Icon(
                                    Icons.edit,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ))
                      ]),
                      const SizedBox(
                        height: 70.0,
                      ),
                      Column(
                          children: List.generate(
                              settingOptions.length,
                              (index) => GestureDetector(
                                    onTap: () => Get.to(() => UpdateProfileView(
                                        profilePicture: profilePicture,
                                        email: email,
                                        username: username,
                                        textData: settingOptions.keys
                                            .elementAt(index),
                                        iconData: settingOptions.values
                                            .elementAt(index),
                                        userInfo: userInfo[index],
                                        password: password,
                                        idToken: idToken)),
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      height: 50,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              110, 113, 113, 113),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    settingOptions.values
                                                        .elementAt(index),
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    settingOptions.keys
                                                        .elementAt(index),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey,
                                                        fontFamily: "normal"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.3,
                                              child: Text(
                                                userInfo[index],
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: "normal",
                                                    fontSize: 14),
                                              ),
                                            ),
                                            const Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Colors.grey,
                                              size: 35,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )).toList()),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
              () => AppBarCustom(
                onTap: () {
                  Get.back();
                  if (updateProfileController.isSavedImage.value == false) {
                    updateProfileController.newProfilePictureGallery = null;
                    Get.forceAppUpdate();
                  }
                  updateProfileController.showCheck.value = false;
                },
                title: "Profile",
                fontSize: 18,
                checkIcon: updateProfileController.showCheck.value == true
                    ? GestureDetector(
                        onTap: updateProfileController.isLoading.value == true
                            ? () {}
                            : () => updateProfileController
                                .updateProfilePictureWGallery(context, idToken),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    : const SizedBox(
                        width: 30.0,
                      ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
