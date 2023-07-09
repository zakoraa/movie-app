import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/home/view/home_view.dart';
import 'package:movieapp/movie/controllers/movie_get_discovere.dart';

import 'routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF2C2C2C),
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          )),
      home: const HomeView(),
      getPages: AppPage.pages,
    );
  }
}
