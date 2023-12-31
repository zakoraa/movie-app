// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/module/login/view/login_view.dart';
import 'package:movieapp/module/movieDetails/controller/movie_details_controller.dart';
import 'package:movieapp/shared/theme/theme_data.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController =
        Get.put(MovieDetailsController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeDataCostum.themeData,
      home: const LoginView(),
    );
  }
}

// flutter run -d chrome --web-renderer html 
