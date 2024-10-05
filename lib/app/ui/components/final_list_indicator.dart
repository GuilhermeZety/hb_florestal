import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/constants/app_colors.dart';
import 'package:hb_florestal/app/core/common/extensions/widget/widget_extension.dart';

class FinalListIndicator extends StatelessWidget {
  const FinalListIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 5,
          decoration: BoxDecoration(
            color: AppColors.grey_300.withOpacity(0.8),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    ).pTop(8);
  }
}
