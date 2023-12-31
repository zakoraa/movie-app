// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/movieDetails/controller/movie_details_controller.dart';
import 'package:movieapp/shared/theme/colors.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.imgHeight,
    required this.movie,
  }) : super(key: key);

  final double imgHeight;
  final movie;

  @override
  Widget build(BuildContext context) {
    MovieDetailsController controller = Get.find<MovieDetailsController>();
    if (movie.favorite == false) {
      controller.isLiked.value = false;
    } else {
      controller.isLiked.value = true;
    }
    return Container(
        width: Get.size.width,
        height: Get.size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Color.fromARGB(205, 13, 7, 7),
              Color(0xFF0D0707),
              Color(0xFF0D0707),
            ])),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: imgHeight - 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      "${movie.title} (${movie.releaseDate})",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        controller.handleLike(movie);
                      },
                      child: Obx(() => controller.isLiked.value
                          ? const Icon(
                              Icons.favorite,
                              color: CustomColor.secondaryBgColor,
                              size: 30,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              size: 30,
                            )))
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              (movie.rating == "")
                  ? const SizedBox.shrink()
                  : Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${movie.rating}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      Text(
                        "${movie.overview}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ]),
              )
            ],
          ),
        ));
  }
}

// EHH BELUM REMOVENYA BELUM HEHE
