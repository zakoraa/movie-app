import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/movie/controllers/movie_get_discovere.dart';

import '../widget/carousel_slider_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/trending_now.dart';
import '../widget/header_widget.dart';
import '../widget/list_view_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
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
            Obx(()=>(movieController.isLoading.value)
                ? SizedBox(
                    height: Get.size.height,
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        backgroundColor: Colors.grey,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: Get.size.width,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            HeaderWidget(),
                            SizedBox(
                              height: 30.0,
                            ),
                            CarouselSliderWidget(),
                            ListViewWidget(),
                            TrendingNow(),
                          ],
                        ),
                      ),
                    ),
                  ),)
          ],
        ),
      ),
    );
  }
}
