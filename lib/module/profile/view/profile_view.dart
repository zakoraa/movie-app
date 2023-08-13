import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/profile/controller/profile_controller.dart';
import 'package:movieapp/module/updateProfile/view/update_profile_view.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
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
    print(updateProfileController.showCheck.value);
    return Scaffold(
      body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: ScaffoldBackgroundTemplate(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SizedBox(
                    width: Get.width * 0.9,
                    child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Column(children: [
                            Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 30.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                          if (updateProfileController
                                                  .isSavedImage.value ==
                                              false) {
                                            updateProfileController
                                                    .newProfilePictureGallery =
                                                null;
                                            Get.forceAppUpdate();
                                          }
                                          updateProfileController
                                              .showCheck.value = false;
                                        },
                                        child: const Icon(
                                          Icons.arrow_back,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "Profile",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    updateProfileController.showCheck.value ==
                                            true
                                        ? GestureDetector(
                                            onTap: () => updateProfileController
                                                .updateProfilePictureWGallery(
                                                    idToken),
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.amber,
                                              size: 30,
                                            ),
                                          )
                                        : const SizedBox(
                                            width: 30.0,
                                          ),
                                  ],
                                )),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Stack(children: [
                              const ProfilePictureWidget(
                                  size: 150, tag: "Profile"),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () =>
                                        controller.showImageUploadOption(
                                            context,
                                            updateProfileController
                                                        .newIdToken ==
                                                    null
                                                ? idToken
                                                : updateProfileController
                                                    .newIdToken!),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFFB039),
                                          borderRadius:
                                              BorderRadius.circular(40)),
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
                              (index) => Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                height: 60,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        110, 113, 113, 113),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
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
                                              size: 25,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              settingOptions.keys
                                                  .elementAt(index),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: "normal",
                                              fontSize: 16),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.to(() =>
                                            UpdateProfileView(
                                                profilePicture: profilePicture,
                                                email: email,
                                                username: username,
                                                textData:
                                                    settingOptions
                                                        .keys
                                                        .elementAt(index),
                                                iconData: settingOptions.values
                                                    .elementAt(index),
                                                userInfo: userInfo[index],
                                                password: password,
                                                idToken: idToken)),
                                        child: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.grey,
                                          size: 40,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ).toList()),
                          ]),
                        ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
