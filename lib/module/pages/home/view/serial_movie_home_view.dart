import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/serial_movie_controller.dart';
import '../../../widgets/home_view.dart';

class SerialMovieHomeView extends StatelessWidget {
  const SerialMovieHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    MovieSerialController movieSerialController =
        Get.find<MovieSerialController>();
    return HomeView(carouselMovieList: movieSerialController.carouselSliderMovieSerialList,
    listViewMovieList: movieSerialController.listMovieSerialList,
    trendingNowMovieList: movieSerialController.trendingNowMovieSerialList,);
  }
}
