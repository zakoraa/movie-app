// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/controllers/movie_controller.dart';
import 'package:movieapp/shared/widgets/list_tile_widget.dart';

import '../../controllers/home_controller.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key, required this.trendingNowMovieList});

  final trendingNowMovieList;

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    HomeController homeController = Get.put(HomeController());
    homeController.sortedByRating(trendingNowMovieList);
    List trendingMovies = trendingNowMovieList.take(3).toList();
    return (movieController.isLoading.value)
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  "Trending Now",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTileWidget(listMovie: trendingMovies)
            ],
          );
  }
}
