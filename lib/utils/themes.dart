import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haupcar_assignment/utils/const_colors.dart';

class Themes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ConstColors.whiteColor,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: ConstColors.lightGrey,
      tertiary: ConstColors.darkGrey,
      secondary: Colors.black,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.lexend(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
      titleSmall: GoogleFonts.lexend(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
      bodyLarge: GoogleFonts.lexend(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
      bodyMedium: GoogleFonts.lexend(
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
      bodySmall: GoogleFonts.lexend(
        fontSize: 14,
        height: 16 / 14,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
      labelLarge: GoogleFonts.lexend(
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
      labelMedium: GoogleFonts.lexend(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
      labelSmall: GoogleFonts.lexend(
        fontSize: 14,
        height: 16 / 14,
        fontWeight: FontWeight.w400,
        color: ConstColors.blackColor,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade300,
      thickness: 1,
    ),
  );
}
