import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProfilePicture extends StatelessWidget {
  const DetailProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Hero(
            tag: "imageTag",
            child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.network(
                    "https://pbs.twimg.com/media/FnQKQaWXoAADHK0.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
