// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/shared/theme/colors.dart';

class FormLoginSignup extends StatelessWidget {
  const FormLoginSignup({super.key, required this.content});

  final content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBgColor,
      body: Container(
          height: Get.size.height,
          width: Get.size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bg_login.jpg",
                  ),
                  fit: BoxFit.cover)),
          child: content),
    );
  }
}
