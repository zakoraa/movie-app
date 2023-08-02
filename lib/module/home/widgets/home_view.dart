// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/module/home/controllers/movie_get_discover.dart';
import 'package:movieapp/module/home/controllers/serial_movie_controller.dart';
import 'package:movieapp/shared/utils/loading.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
import 'carousel_slider_widget.dart';
import 'drawer_widget.dart';
import 'header_widget.dart';
import 'list_view_widget.dart';
import 'select_type.dart';
import 'trending_now.dart';

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
    return Obx(() {
      homeController.sortedByYear(listViewMovieList);
      return movieController.isLoading.value &&
              movieSerialController.isLoading.value
          ? const Scaffold(
              body: ScaffoldBackgroundTemplate(child: LoadingView()))
          : Scaffold(
              drawer: const DrawerWidget(),
              body: SizedBox(
                  height: Get.size.height,
                  width: Get.size.width,
                  child: ScaffoldBackgroundTemplate(
                      child: SingleChildScrollView(
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
                              const SizedBox(
                                height: 20.0,
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
                              homeController.moviesIn2023.length <= 3
                                  ? const SizedBox.shrink()
                                  : ListViewWidget(
                                      text: "2023",
                                      listViewMovieList:
                                          homeController.moviesIn2023,
                                    ),
                              homeController.moviesBefore2023.length <= 3
                                  ? const SizedBox.shrink()
                                  : ListViewWidget(
                                      text: "Before 2023",
                                      listViewMovieList:
                                          homeController.moviesBefore2023,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))),
            );
    });
  }
}
