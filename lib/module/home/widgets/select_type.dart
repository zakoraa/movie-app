// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/controllers/movie_controller.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';

import '../controllers/serial_movie_controller.dart';

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
    List<String> movieType = ["Movies", "Serial TV"];
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
                  width: 75,
                  decoration: BoxDecoration(
                      color: (homeController.selectedIndex.value == index)
                          ? const Color(0xFFFFAC4A)
                          : const Color.fromARGB(46, 144, 143, 143),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(right: 10),
                  child: Center(
                    child: Text(
                      movieType[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.w200, fontSize: 12),
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
