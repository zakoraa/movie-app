// ignore_for_file: implementation_imports, unused_import

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/home/controllers/home_controller.dart';
import 'package:movieapp/module/pages/home/view/movie_home_view.dart';
import 'package:movieapp/module/pages/home/view/serial_movie_home_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>_buildPage());
  }
}

Widget _buildPage() {
  HomeController homeController = Get.find<HomeController>();
  switch (homeController.selectedIndex.value) {
    case 0:
      return const MovieHomeView();
    case 1:
      return const SerialMovieHomeView();
    default:
      return const MainPage();
  }
}
