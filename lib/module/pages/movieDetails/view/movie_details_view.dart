// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/imageAPI/image_url_api.dart';
import '../widgets/description_widget.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, this.movie});
  final movie;

  @override
  Widget build(BuildContext context) {
    double imgHeight = Get.size.height * 0.8;
    double imgWidth = Get.size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              "${ImageUrlApi.imageUrlOriginal}${movie.poster}",
              fit: BoxFit.cover,
              height: imgHeight,
              width: imgWidth,
            ),
            Description(imgHeight: imgHeight, movie: movie),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
