import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/main_page.dart';
import 'package:movieapp/module/profile/controller/profille_controller.dart';
import 'package:movieapp/module/updateProfile/view/update_profile_view.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';

import '../../home/widgets/detail_profile_picture.dart';

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
    ProfileController controller = Get.put(ProfileController());

    Map<String, dynamic> settingOptions = {
      "Username": Icons.person,
      "Email": Icons.email,
      "Password": Icons.key,
    };

    List<String> userInfo = [username, email, "********"];
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
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30.0,
                            child: GestureDetector(
                              onTap: () => Get.to(() => const MainPage()),
                              child: const Icon(
                                Icons.arrow_back,
                              ),
                            ),
                          ),
                          const Text(
                            "Profile",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Stack(children: [
                        GestureDetector(
                            onTap: () => Get.to(
                                () => const DetailProfilePicture(),
                                opaque: false,
                                fullscreenDialog: true,
                                transition: Transition.circularReveal),
                            child: Hero(
                              tag: "profileImage",
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.network(
                                  profilePicture,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.showImageUploadOption(context);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFB039),
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
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 60,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(110, 113, 113, 113),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.3,
                                  child: Row(
                                    children: [
                                      Icon(
                                        settingOptions.values.elementAt(index),
                                        size: 25,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        settingOptions.keys.elementAt(index),
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
                                  onTap: () => Get.to(() => UpdateProfileView(
                                      textData:
                                          settingOptions.keys.elementAt(index),
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
                  ),
                ),
              ),
            ),
          )),
    );
  }
}