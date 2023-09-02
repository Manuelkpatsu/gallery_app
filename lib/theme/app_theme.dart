import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    final bitterFont = GoogleFonts.bitter(fontWeight: FontWeight.w700);

    return ThemeData(
      scaffoldBackgroundColor: AppColors.grey,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.black,
        inversePrimary: AppColors.black,
        onPrimary: AppColors.grey,
      ),
      primaryColor: AppColors.green,
      canvasColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: AppColors.black,
        iconTheme: const IconThemeData(color: AppColors.grey),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.grey,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          elevation: 0,
          foregroundColor: AppColors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          minimumSize: const Size.fromHeight(50),
        ),
      ),
      primaryTextTheme: TextTheme(titleLarge: bitterFont),
      textTheme: TextTheme(
        titleMedium: bitterFont.apply(color: AppColors.grey),
        titleLarge: bitterFont.apply(color: AppColors.grey),
        bodyMedium: const TextStyle(color: AppColors.grey),
      ),
    );
  }
}
