// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
import 'package:movieapp/shared/widgets/button_widget.dart';
import 'package:movieapp/shared/widgets/textfield_widget.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView(
      {super.key,
      this.controller,
      required this.textData,
      this.userInfo,
      required this.password,
      this.profilePicture,
      this.email,
      this.username,
      this.hintText,
      this.isNotPrevious = false,
      required this.idToken,
      required this.iconData});

  final controller;
  final bool isNotPrevious;
  final String textData, password, idToken;
  final String? hintText, userInfo, email, username, profilePicture;
  final iconData;

  @override
  Widget build(BuildContext context) {
    UpdateProfileController controller = Get.put(UpdateProfileController());
    return Scaffold(
      body: ScaffoldBackgroundTemplate(
        child: Center(
          child: SizedBox(
            height: Get.height,
            width: Get.width * 0.9,
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 35,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.forceAppUpdate();
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.5,
                      child: Center(
                        child: Text(
                          "Update Your $textData",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 35.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  textData == "Profile Picture"
                      ? "Url link format must end in .jpg .jpeg or .png"
                      : textData == "Password"
                          ? "New password can't be the same as old password"
                          : "Previous $textData : $userInfo",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: "normal",
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFieldWidget(
                  loginSignup: false,
                  text: textData,
                  icon: iconData,
                  controller: controller.username,
                  selectedController: controller,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ButtonWidget(
                    fontSize: 14,
                    height: 40,
                    width: Get.width * 0.9,
                    onTap: () {
                      if (textData == "Username") {
                        controller.updateUsername(context, idToken);
                      }
                    },
                    controller: controller,
                    text: "Save")
              ],
            )),
          ),
        ),
      ),
    );
  }
}
