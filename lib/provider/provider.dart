import 'package:flutter/material.dart';

class DynamicTheming with ChangeNotifier {
  final TimeOfDay _timeOfDay = TimeOfDay.now();
  String _greeting = "";
  ThemeData? _themeData;

  ThemeData getTheme() {
    if (_timeOfDay.hour <= 17) {
      _themeData = ThemeData.light();
    } else {
      _themeData = ThemeData.dark();
    }
    return _themeData ?? ThemeData.light();
  }

  getGreeting() {
    if (_timeOfDay.hour < 12) {
      _greeting = 'Good morning';
    } else if (_timeOfDay.hour < 17) {
      _greeting = 'Good afternoon';
    } else {
      _greeting = 'Good evening';
    }
    return _greeting;
  }
}
