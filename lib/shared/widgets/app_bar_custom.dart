// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key,
    required this.onTap,
    required this.title,
    this.fontSize = 20,
    this.checkIcon,
  });

  final onTap, checkIcon;
  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 35.0,
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.5,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          checkIcon ??
              const SizedBox(
                width: 35.0,
              ),
        ],
      ),
    );
  }
}
