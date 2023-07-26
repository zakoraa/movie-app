// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLoginSignup extends StatelessWidget {
  const FormLoginSignup({super.key, required this.content});
  
  final content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                      height: Get.size.height * 0.5,
                      width: Get.size.width,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 1.0],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.network(
                          "https://bacaterus.com/wp-content/uploads/2021/09/You-S1_.webp",
                          fit: BoxFit.cover,
                        ),
                      ))),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/Ellipse 2.png",
                    scale: 2,
                  )),
              Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "assets/Ellipse 1.png",
                    scale: 2,
                  )),
              content
            ],
          ),
        ));
  }
}
