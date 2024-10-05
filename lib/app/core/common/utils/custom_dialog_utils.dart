import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/extensions/context_extension.dart';

Future<T?> showCustomDialog<T>(
  BuildContext context, {
  required Widget child,
  bool isDismissible = true,
  bool isScrollControlled = true,
  bool enableDrag = true,
  double elevation = 0,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(
      maxHeight: context.height * 0.95,
      minHeight: context.height * 0.4,
    ),
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    elevation: elevation,
    builder: (context) => child,
  );
}
