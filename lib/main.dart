// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/main_page.dart';
import 'package:movieapp/module/home/widgets/home_view.dart';
import 'package:movieapp/module/login/view/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
