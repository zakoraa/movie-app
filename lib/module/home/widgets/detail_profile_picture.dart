import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProfilePicture extends StatelessWidget {
  const DetailProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Hero(
            tag: "image",
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(250),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.network(
                      "https://pbs.twimg.com/media/FnQKQaWXoAADHK0.jpg",
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
