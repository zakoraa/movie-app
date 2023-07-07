import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/movie/controllers/movie_get_discovere.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return Obx(() {
    final movies = movieController.forYouListMovie.take(7).toList();
      return Center(
        child: Column(
            children: movies
                .map((movie) => Container(
                      height: 150,
                      width: Get.size.width * 0.9,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(106, 112, 111, 111),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500/${movie.poster}",
                                    height: 150,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ))
                .toList()),
      );
    });
  }
}
