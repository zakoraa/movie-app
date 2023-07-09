import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/home/controllers/home_controller.dart';
import 'package:movieapp/movie/controllers/movie_get_discovere.dart';

import '../../../../movie/models/movie_model.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    HomeController homeController = Get.put(HomeController());
    final movies = movieController.carouselSliderListMovie;
    return Obx(() {
    homeController.refreshList(movies);
      List<Movie> carouselListMovie = movies.take(5).toList();
      return (movieController.isLoading.value)
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.white,
              ),
            )
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "${MovieController.imageUrlOriginal}${movie.backdrop}",
                      fit: BoxFit.cover,
                      height: 225,
                      width: Get.size.width,
                    ),
                  ),
                );
              }).toList(),
            );
    });
  }
}
