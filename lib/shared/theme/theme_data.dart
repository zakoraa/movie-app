import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/shared/theme/colors.dart';

abstract class ThemeDataCostum {
  static var themeData = ThemeData(
      dialogBackgroundColor: CustomColor.primaryBgColor,
      scaffoldBackgroundColor: CustomColor.primaryBgColor,
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF), size: 35),
      textTheme: TextTheme(
        bodyText2: GoogleFonts.poppins(
          color: CustomColor.textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ));
}
