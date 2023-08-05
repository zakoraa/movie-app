// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/module/profileView/view/profile_view.dart';

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
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF), size: 35),
          textTheme: TextTheme(
            bodyText2: GoogleFonts.poppins(
              color: const Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )),
      home: const ProfileView(),
    );
  }
}
