// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
import 'package:movieapp/shared/widgets/app_bar_custom.dart';
import 'package:movieapp/shared/widgets/button_widget.dart';
import 'package:movieapp/shared/widgets/textfield_widget.dart';

class UpdateProfileView extends StatelessWidget {
  UpdateProfileView(
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
  final String textData, password;
  String idToken;
  final String? hintText, userInfo, email, username, profilePicture;
  final iconData;

  @override
  Widget build(BuildContext context) {
    UpdateProfileController controller = Get.put(UpdateProfileController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScaffoldBackgroundTemplate(
        child: SizedBox(
          width: Get.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      text:
                          textData == "Profile Picture" ? "Url Link" : textData,
                      icon: iconData,
                      controller: controller.textEditingController,
                      selectedController: controller,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ButtonWidget(
                        fontSize: 14,
                        height: 40,
                        width: Get.width * 0.9,
                        onTap: () async {
                          if (textData == "Username") {
                            controller.newIdToken == null
                                ? await controller.updateUsername(
                                    context, idToken)
                                : await controller.updateUsername(
                                    context, controller.newIdToken);
                          } else if (textData == "Email") {
                            controller.newIdToken == null
                                ? await controller.updateEmail(context, idToken)
                                : await controller.updateEmail(
                                    context, controller.newIdToken);
                          } else if (textData == "Password") {
                            controller.newIdToken == null
                                ? await controller.updatePassword(
                                    context, idToken)
                                : await controller.updatePassword(
                                    context, controller.newIdToken);
                          } else if (textData == "Profile Picture") {
                            controller.newIdToken == null
                                ? await controller.updateProfilePictureWUrl(
                                    context, idToken)
                                : await controller.updateProfilePictureWUrl(
                                    context, controller.newIdToken);
                          }
                        },
                        controller: controller,
                        text: "Save")
                  ],
                ),
              ),
              AppBarCustom(
                onTap: () {
                  Get.back();
                  controller.textEditingController!.clear();
                },
                title: "Update Your $textData",
                fontSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
