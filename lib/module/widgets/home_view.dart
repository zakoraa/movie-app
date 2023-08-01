// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/home/controllers/home_controller.dart';
import 'package:movieapp/module/pages/home/controllers/movie_get_discover.dart';
import 'package:movieapp/module/pages/home/controllers/serial_movie_controller.dart';
import 'package:movieapp/utils/loading.dart';
import '../pages/home/widgets/carousel_slider_widget.dart';
import '../pages/home/widgets/drawer_widget.dart';
import '../pages/home/widgets/header_widget.dart';
import '../pages/home/widgets/list_view_widget.dart';
import '../pages/home/widgets/select_type.dart';
import '../pages/home/widgets/trending_now.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.carouselMovieList,
    required this.listViewMovieList,
    required this.trendingNowMovieList,
  });

  final carouselMovieList;
  final listViewMovieList;
  final trendingNowMovieList;

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
    MovieSerialController movieSerialController =
        Get.find<MovieSerialController>();
    HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      drawer: const DrawerWidget(),
      body: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  "assets/Ellipse 2.png",
                  scale: 1.5,
                )),
            Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/Ellipse 1.png",
                  scale: 1.5,
                )),
            //
            Obx(() {
              homeController.sortedByYear(listViewMovieList);
              return (movieController.isLoading.value &&
                      movieSerialController.isLoading.value)
                  ? const LoadingView()
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeaderWidget(),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const SelectType(),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                CarouselSliderWidget(
                                  carouselMovieList: carouselMovieList,
                                ),
                                ListViewWidget(
                                  text: "For You",
                                  listViewMovieList: listViewMovieList,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TrendingNow(
                                  trendingNowMovieList: trendingNowMovieList,
                                ),
                                ListViewWidget(
                                  text: "2023",
                                  listViewMovieList:
                                      homeController.moviesIn2023,
                                ),
                                ListViewWidget(
                                  text: "Before 2023",
                                  listViewMovieList:
                                      homeController.moviesBefore2023,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}
