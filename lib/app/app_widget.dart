import 'package:flutter/material.dart';
import 'package:hb_florestal/app/core/common/constants/app_theme.dart';
import 'package:hb_florestal/app/modules/splash/presentation/pages/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HB AgroFlorestal',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
