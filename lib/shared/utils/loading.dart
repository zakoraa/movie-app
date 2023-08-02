import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.size.height,
      width: Get.size.width,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.white, size: 40),
      ),
    );
  }
}
