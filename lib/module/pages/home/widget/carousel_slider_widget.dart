import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movieapp/module/pages/home/controllers/home_controller.dart';
import 'package:movieapp/movie/controllers/movie_get_discover.dart';

import '../../../../movie/models/movie_model.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
    HomeController homeController = Get.put(HomeController());
    final movies = movieController.carouselSliderListMovie;
    return Obx(() {
      homeController.refreshList(movies);
      List<Movie> carouselListMovie = movies.take(5).toList();
      return (movieController.isLoading.value)
          ? const SizedBox.shrink()
          : CarouselSlider(
              options: CarouselOptions(
                height: 225,
                viewportFraction: 0.8,
                autoPlay: true, //otomatis kegeser sendiri
                autoPlayAnimationDuration:
                    const Duration(seconds: 4), //lama animasi gesernya
                autoPlayInterval: const Duration(seconds: 7), // waktu
                enlargeCenterPage: true,
              ),
              items: carouselListMovie.map((movie) {
                return Container(
                  width: Get.size.width,
                  height: 225,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "${MovieController.imageUrlOriginal}${movie.backdrop}",
                          fit: BoxFit.cover,
                          height: 225,
                          width: Get.size.width,
                          loadingBuilder: (context, child, loadingProgress) =>
                              (loadingProgress == null)
                                  ? child
                                  : SizedBox(
                                      height: Get.size.height,
                                      child: Center(
                                        child: LoadingAnimationWidget
                                            .horizontalRotatingDots(
                                                color: Colors.white, size: 40),
                                      ),
                                    ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Container(
                            height: 30,
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            constraints:
                                BoxConstraints(maxWidth: Get.size.width * 0.6),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(98, 0, 0, 0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "${movie.title}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
    });
  }
}
