import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/controllers/movie_controller.dart';
import '../widgets/homeWidgets/home_view.dart';

class MovieHomeView extends StatelessWidget {
  const MovieHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return HomeView(carouselMovieList: movieController.carouselSliderMovieList,
    listViewMovieList: movieController.listViewMovieList,
    trendingNowMovieList: movieController.trendingNowMovieList,);
  }
}
