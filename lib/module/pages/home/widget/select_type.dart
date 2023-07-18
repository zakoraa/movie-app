import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/api/movie/controllers/movie_get_discover.dart';
import 'package:movieapp/module/pages/home/controllers/home_controller.dart';

import '../../../../api/movieSerial/controllers/movie_serial_controller.dart';

class SelectType extends StatelessWidget {
  const SelectType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    MovieController movieController = Get.find<MovieController>();
    MovieSerialController movieSerialController =
        Get.put(MovieSerialController());
    Map<String, dynamic> movieType = {
      "Movies": movieController,
      "Serial TV": movieSerialController,
    };
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 40,
        width: Get.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Obx(() => GestureDetector(
                onTap: () => homeController.selectIndex(index),
                child: Container(
                  height: 40,
                  width: 85,
                  decoration: BoxDecoration(
                      color: (homeController.selectedIndex.value == index)
                          ? const Color.fromARGB(173, 255, 193, 7)
                          : const Color.fromARGB(46, 144, 143, 143),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(right: 10),
                  child: Center(
                    child: Text(
                      movieType.keys.elementAt(index),
                      style: const TextStyle(
                          fontWeight: FontWeight.w200, fontSize: 14),
                    ),
                  ),
                ),
              )),
          itemCount: movieType.length,
        ),
      ),
    );
  }
}
