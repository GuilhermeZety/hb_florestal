import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/constants/app_fonts.dart';
import 'package:hb_florestal/app/core/common/extensions/color_extension.dart';

class AppTheme {
  //SingleTon
  AppTheme._();
  static final AppTheme _instance = AppTheme._();
  factory AppTheme() => AppTheme._instance;
  //

  final ThemeMode themeMode = ThemeMode.light;

  static ThemeData get light => ThemeData(
        fontFamily: AppFonts.defaultFont,
        primarySwatch: AppColors.primary.toMaterialColor(),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.primary,
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary.withOpacity(0.2),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.grey_900, fontWeight: AppFonts.bold, fontSize: 32, letterSpacing: 0.3),
          titleMedium: TextStyle(color: AppColors.grey_800, fontWeight: AppFonts.semiBold),
          titleSmall: TextStyle(color: AppColors.grey_700, fontWeight: AppFonts.normal),
          displayLarge: TextStyle(color: AppColors.grey_700, letterSpacing: 0.3),
          displayMedium: TextStyle(color: AppColors.grey_700, letterSpacing: 0.3),
          displaySmall: TextStyle(color: AppColors.grey_700, letterSpacing: 0.3),
          bodyMedium: TextStyle(color: AppColors.grey_700, letterSpacing: 0.3),
          bodySmall: TextStyle(color: AppColors.grey_400, letterSpacing: 0.3),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.grey_700,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: AppColors.green_50,
        canvasColor: AppColors.white,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primary,
          primaryContainer: AppColors.green_50,
          secondaryContainer: AppColors.white,
          tertiaryContainer: AppColors.grey_100,
          surface: AppColors.white,
          error: AppColors.error,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          prefixIconColor: AppColors.grey_300,
          fillColor: AppColors.white,
          hintStyle: TextStyle(
            color: AppColors.grey_300.withOpacity(0.8),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16),
          focusedBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              width: 2,
              color: AppColors.primary,
            ),
          ),
          //DISABLE  ------
          disabledBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              width: 0,
              color: Colors.transparent,
            ),
          ),
          //ERROR  ------
          errorStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.error.withOpacity(0.5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              width: 1.5,
              color: AppColors.error,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              width: 2.5,
              color: AppColors.error,
            ),
          ),
        ),
      );
}
