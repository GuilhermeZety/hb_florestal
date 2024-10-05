import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = green_500;

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey_50 = Color(0xFFF7F7F8);
  static const Color grey_100 = Color(0xFFEEEEF0);
  static const Color grey_200 = Color(0xFFDADADD);
  static const Color grey_300 = Color(0xFFBABBBF);
  static const Color grey_400 = Color(0xFF94959C);
  static const Color grey_500 = Color(0xFF767681);
  static const Color grey_600 = Color(0xFF606169);
  static const Color grey_700 = Color(0xFF4E4E56);
  static const Color grey_800 = Color(0xFF29292E);
  static const Color grey_850 = Color(0xFF272727);
  static const Color grey_900 = Color(0xFF161818);
  static const Color grey_950 = Color(0xFF121414);

  static const Color black = Color(0xFF101010);

  //
  static const Color blue_600 = Color(0xFF313B4D);
  static const Color blue_700 = Color(0xFF21242E);
  static const Color blue_800 = Color(0xFF181C24);

  //
  static const Color green_50 = Color(0xFFEDF8EC);
  static const Color green_500 = Color(0xFF00A95A);

  static const LinearGradient gradient = LinearGradient(
    colors: [
      green_500,
      green_500,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  //
  static const Color info = Color(0xFF0079BC);
  static const Color success = Color(0xFF34E46F);
  static const Color warning = Color(0xFFF0B200);
  static const Color error = Color(0xFFD34A4A);
}
