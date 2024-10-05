import 'package:shared_preferences/shared_preferences.dart';

class CurrentSession {
  //SingleTon
  CurrentSession._();
  static final CurrentSession _instance = CurrentSession._();
  factory CurrentSession() => CurrentSession._instance;
  //

  late SharedPreferences prefs;

  void init() async {
    await SharedPreferences.getInstance().then((pref) => prefs = pref);
  }
}
