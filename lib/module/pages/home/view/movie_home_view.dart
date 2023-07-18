import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/api/movie/controllers/movie_get_discover.dart';
import '../../../widgets/home_view.dart';

class MovieHomeView extends StatelessWidget {
  const MovieHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
    return HomeView(carouselMovieList: movieController.carouselSliderMovieList,
    listViewMovieList: movieController.listViewMovieList,
    trendingNowMovieList: movieController.trendingNowMovieList,);
  }
}