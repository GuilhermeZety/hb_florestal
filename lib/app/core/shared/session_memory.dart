import 'dart:typed_data';

import 'package:hb_florestal/app/core/common/constants/app_assets.dart';
import 'package:hb_florestal/app/core/common/utils/utils.dart';

class SessionMemory {
  //SingleTon
  SessionMemory._();
  static final SessionMemory _instance = SessionMemory._();
  factory SessionMemory() => SessionMemory._instance;
  //

  Future load() async {
    var [
      logo,
      background,
      mouse,
    ] = await Future.wait([
      Utils.getAssetsBytes(AppAssets.images.logo),
      Utils.getAssetsBytes(AppAssets.images.background),
      Utils.getAssetsBytes(AppAssets.svgs.mouse),
    ]);
    logoPNG = logo;
    backgroundPNG = background;
    mouseSVG = mouse;
  }

  late Uint8List logoPNG;
  late Uint8List backgroundPNG;
  late Uint8List mouseSVG;
}
