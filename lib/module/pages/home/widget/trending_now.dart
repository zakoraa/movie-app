import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/movie/controllers/movie_get_discovere.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return Obx(() {
      final movies = movieController.trendingListMovie.take(3).toList();
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
              children: movies
                  .map((movie) => Column(
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
                                                "https://image.tmdb.org/t/p/w500/${movie.poster}",
                                                height: 120,
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
                                              width: 130,
                                              child: Text(
                                                "${movie.title}",
                                                textAlign: TextAlign.justify,
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 30),
                                            child: SizedBox(
                                              width: 130,
                                              child: Text(
                                                movie.releaseDate!
                                                    .substring(0, 4),
                                                textAlign: TextAlign.justify,
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
                      ))
                  .toList()),
        ),
      );
    });
  }
}
