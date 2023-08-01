// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/home/controllers/movie_get_discover.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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

    return Scaffold(
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Positioned(top: 0, child: Image.asset("assets/Ellipse 2.png")),
            Positioned(top: 225, child: Image.asset("assets/Ellipse 1.png")),
            Positioned(
              bottom: 0,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                  child: Image.asset("assets/Ellipse 1.png")),
            ),
            Obx(() {
              return (movieController.isLoading.value &&
                      movieSerialController.isLoading.value)
                  ? const LoadingView()
                  : Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: Get.size.width,
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
                                listViewMovieList: listViewMovieList,
                              ),
                              TrendingNow(
                                trendingNowMovieList: trendingNowMovieList,
                              ),
                            ],
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
