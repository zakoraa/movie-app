// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../shared/utils/image_url_api.dart';
import '../widget/description_widget.dart';

class MovieDetailsView extends StatelessWidget {
  MovieDetailsView({super.key, required this.movie});
  final movie;

  @override
  Widget build(BuildContext context) {
    double imgHeight = Get.size.height * 0.8;
    double imgWidth = Get.size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0D0707),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Image.network(movie.poster == "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png"?
                          "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png":"${ImageUrlApi.imageUrlOriginal}${movie.poster}",
                  fit: BoxFit.cover,
                  height: imgHeight,
                  width: imgWidth,
                  loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : SizedBox(
                              height: imgHeight,
                              child: Center(
                                child: LoadingAnimationWidget
                                    .horizontalRotatingDots(
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
              Description(imgHeight: imgHeight, movie: movie),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
