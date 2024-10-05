import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';

class NamedTitle extends StatelessWidget {
  const NamedTitle({super.key, required this.title, required this.subtitle, this.fontSize, this.gap});

  final String title;
  final String subtitle;
  final double? fontSize;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: fontSize ?? 80,
              fontWeight: FontWeight.normal,
              color: AppColors.grey_800,
              height: 0.7,
            )),
        Gap(gap ?? 20),
        Text(subtitle,
            style: TextStyle(
              fontSize: fontSize ?? 80,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              height: 0.7,
            )).pLeft((fontSize ?? 80) / 2),
      ],
    );
  }
}