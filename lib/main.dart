// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api/movie/controllers/movie_get_discover.dart';
import 'package:movieapp/main_page.dart';
import 'package:movieapp/module/pages/home/view/movie_home_view.dart';
import 'package:movieapp/module/pages/home/view/serial_movie_home_view.dart';
import 'package:movieapp/module/pages/login/view/login_view.dart';
import 'api/movieSerial/controllers/movie_serial_controller.dart';
import 'module/pages/home/controllers/home_controller.dart';
import 'routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    HomeController homeController = Get.put(HomeController());
    MovieSerialController movieSerialController = Get.put(MovieSerialController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF2C2C2C),
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          textTheme: TextTheme(
            bodyText2: GoogleFonts.poppins(
              color: const Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          )),
      home: const MainPage(),
      getPages: AppPage.pages,
    );
  }
}
