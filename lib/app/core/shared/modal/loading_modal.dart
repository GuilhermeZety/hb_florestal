import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hb_florestal/app/core/common/constants/app_fonts.dart';
import 'package:hb_florestal/app/ui/components/loader.dart';

class LoadingModal extends StatelessWidget {
  const LoadingModal({super.key, this.title = 'Carregando...'});

  final String title;

  Future show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => this,
    ).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: AppFonts.bold,
                  color: Colors.white,
                ),
              ),
              const Gap(5),
              const Loader(
                size: 50,
                inverted: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
