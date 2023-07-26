// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api/movie/controllers/movie_get_discover.dart';
import 'package:movieapp/firebase/auth_controller.dart';
import 'api/movieSerial/controllers/serial_movie_controller.dart';
import 'module/pages/home/controllers/home_controller.dart';
import 'module/pages/login/view/login_view.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController =
        Get.put(MovieController(), permanent: true);
    HomeController homeController = Get.put(HomeController(), permanent: true);
    MovieSerialController movieSerialController =
        Get.put(MovieSerialController(), permanent: true);
    AuthController authController = Get.put(AuthController(), permanent: true);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          dialogBackgroundColor: const Color(0xFF2C2C2C),
          scaffoldBackgroundColor: const Color(0xFF2C2C2C),
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          textTheme: TextTheme(
            bodyText2: GoogleFonts.poppins(
              color: const Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: const LoginView(),
      getPages: AppPage.pages,
    );
  }
}
