// ignore_for_file: implementation_imports, unused_import, unused_local_variable

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/module/home/view/movie_home_view.dart';
import 'package:movieapp/module/home/view/serial_movie_home_view.dart';
import 'module/home/controllers/movie_controller.dart';
import 'module/home/controllers/serial_movie_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildPage());
  }
}

Widget _buildPage() {
  HomeController homeController = Get.put(HomeController());
  MovieController movieController = Get.put(MovieController());
  MovieSerialController movieSerialController =
      Get.put(MovieSerialController());
  switch (homeController.selectedIndex.value) {
    case 0:
      return const MovieHomeView();
    case 1:
      return const SerialMovieHomeView();
    default:
      return const MainPage();
  }
}
