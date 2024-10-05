// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hb_florestal/app/core/common/transitions/fade_transition.dart';
import 'package:hb_florestal/app/core/shared/prismic_memory.dart';
import 'package:hb_florestal/app/core/shared/session_memory.dart';
import 'package:hb_florestal/app/modules/home/presentation/pages/home_page.dart';
import 'package:hb_florestal/app/ui/components/loader.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SessionMemory().load();
      await PrismicMemory().load();
      Navigator.of(context).pushAndRemoveUntil(FadePageRoute(const HomePage()), (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const SizedBox(
          width: 200,
          height: 200,
          child: Loader(),
        ).animate().fade(delay: 500.ms),
      ),
    );
  }
}
