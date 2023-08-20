// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/signup/controllers/signup_controller.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.text,
      required this.icon,
      this.suffixIcon = false,
      this.obscureText = false,
      this.confirmPass = false,
      this.selectedController = false,
      this.loginSignup = true,
      this.controller})
      : super(key: key);

  final String text;
  final IconData icon;
  final bool suffixIcon, obscureText, confirmPass, loginSignup;
  final controller;
  final selectedController;

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loginSignup == false
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
        const SizedBox(
          height: 10.0,
        ),
        Obx(() {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: loginSignup == false ? 0 : 25),
            child: TextField(
                controller: controller,
                cursorColor: Colors.grey,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: loginSignup == false ? 14 : 12),
                obscureText: obscureText == false
                    ? selectedController.obscureText.value
                    : confirmPass == false
                        ? selectedController.passwordIsVisible.value
                        : signupController.confirmPasswordIsVisible.value,
                decoration: InputDecoration(
                  hintText: text,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
                    icon,
                    color: Colors.grey,
                  ),
                  suffixIcon: suffixIcon == true
                      ? GestureDetector(
                          onTap: () => confirmPass == false
                              ? selectedController.visiblePass()
                              : signupController.visibleConfirmPass(),
                          child: Icon(
                            confirmPass == false
                                ? (!selectedController.passwordIsVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off)
                                : (!signupController
                                        .confirmPasswordIsVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                            color: Colors.grey,
                          ))
                      : const SizedBox.shrink(),
                  fillColor: const Color.fromARGB(67, 158, 158, 158),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: loginSignup == false ? 15 : 10,
                      vertical: loginSignup == false ? 15 : 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(loginSignup == false ? 5 : 10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(loginSignup == false ? 5 : 10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      )),
                )),
          );
        })
      ],
    );
  }
}
