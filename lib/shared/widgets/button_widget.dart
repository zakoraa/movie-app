import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
          color: Colors.transparent,
          elevation: 0.0,
          child: InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            onTap: controller.isLoading.value ? () {} : onTap,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(176, 255, 193, 7),
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
