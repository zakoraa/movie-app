import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/carousel_slider_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/trending_now.dart';
import '../widget/header_widget.dart';
import '../widget/list_view_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
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
            Padding(
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
                      SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("For You"),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ListViewWidget(),
                      SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Trending Now"),
                      ),
                      TrendingNow(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
