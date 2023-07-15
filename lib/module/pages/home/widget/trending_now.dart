import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movieapp/api/movie/controllers/movie_get_discover.dart';
import 'package:movieapp/api/movie/models/movie_model.dart';

import '../../../../api/imageAPI/image_url_api.dart';
import '../controllers/home_controller.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      homeController.sortedByRating();
      RxList<Movie> trendingMovies = homeController.movies.take(3).toList().obs;
      return (movieController.isLoading.value)
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text("Trending Now"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                        children: trendingMovies.map((movie) {
                      return Column(
                        children: [
                          Container(
                            height: 150,
                            width: Get.size.width * 0.9,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(46, 144, 143, 143),
                                borderRadius: BorderRadius.circular(25)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: SizedBox(
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                "${ImageUrlApi.imageUrlW500}${movie.poster}",
                                                height: 120,
                                                loadingBuilder: (context, child,
                                                        loadingProgress) =>
                                                    (loadingProgress == null)
                                                        ? child
                                                        : SizedBox(
                                                            height:
                                                                Get.size.height,
                                                            child: Center(
                                                              child: LoadingAnimationWidget
                                                                  .horizontalRotatingDots(
                                                                      color: Colors
                                                                          .white,
                                                                      size: 40),
                                                            ),
                                                          ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30, left: 30),
                                            child: SizedBox(
                                              width: 120,
                                              child: Text(
                                                "${movie.title}",
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 30),
                                            child: SizedBox(
                                              width: 120,
                                              child: Text(
                                                movie.releaseDate!,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Container(
                                    height: 50,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFFFB039),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 3.0,
                                          ),
                                          Text(
                                            "${movie.rating}",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      );
                    }).toList()),
                  ),
                ),
              ],
            );
    });
  }
}
