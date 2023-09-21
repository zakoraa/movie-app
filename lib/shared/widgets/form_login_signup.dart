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
      body: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: Stack(children: [  
            Positioned(
              right: -30,
              child: Transform.rotate(
                  transformHitTests: true,
                  angle: 0.3,
                  child: Container(
                    color: Colors.black,
                    height: Get.height + 600,
                    width: Get.width * 0.75,
                  )),
            ),
            content
          ])),
    );
  }
}
