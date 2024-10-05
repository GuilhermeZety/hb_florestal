import 'package:flutter/material.dart';
import 'package:hb_florestal/app/app_widget.dart';
import 'package:hb_florestal/app/core/shared/current_session.dart';
import 'package:url_strategy/url_strategy.dart';

double contentMaxWidth = 1200;

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  CurrentSession().init();
  runApp(
    const AppWidget(),
  );
}

bool mainAnimation = true;
