// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';

class AppAssets {
  static AppImages images = AppImages();
  static final AppSvgs svgs = AppSvgs();
}

class AppImages {
  static String get _path => !kDebugMode ? 'assets/images' : 'images';
  final String logo = '$_path/logo.png';
  final String background = '$_path/background.png';
}

class AppSvgs {
  static String get _path => !kDebugMode ? 'assets/svgs' : 'svgs';
  final String mouse = '$_path/mouse.svg';
  final String insta = '$_path/insta.svg';
  final String whats = '$_path/whats.svg';
}
