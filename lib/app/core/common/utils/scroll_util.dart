import 'package:flutter/material.dart';

class ScrollUtil {
  static Future to(BuildContext context) {
    return Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
}
