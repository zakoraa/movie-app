// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/shared/theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
    required this.controller,
    required this.text,
    required this.width,
    required this.height,
    required this.fontSize,
  });

  final onTap, controller;
  final String text;
  final double height, width, fontSize;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
          color: CustomColor.buttonColor,
          borderRadius: BorderRadius.circular(15),
          elevation: 0.0,
          child: InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            onTap: controller.isLoading.value ? () {} : onTap,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                controller.isLoading.value ? "Loading..." : text,
                style: TextStyle(fontSize: fontSize),
              )),
            ),
          ),
        ));
  }
}
