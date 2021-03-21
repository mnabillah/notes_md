import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.cyan,
      accentColor: Colors.redAccent,
      backgroundColor: Colors.white,
      canvasColor: Colors.white);

  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.cyan,
      accentColor: Colors.redAccent,
      backgroundColor: Colors.black45,
      canvasColor: Colors.black45);

  static Color onLight = Colors.black;
  static Color onDark = Colors.white;

  late ThemeData _theme;

  ThemeProvider({theme}) {
    this._theme = theme ?? lightTheme;
  }

  bool isLight() {
    return _theme == lightTheme;
  }

  bool isDark() {
    return _theme == darkTheme;
  }

  switchToLight() {
    if (!isLight()) {
      _theme = lightTheme;
      notifyListeners();
    }
  }

  switchToDark() {
    if (!isDark()) {
      _theme = darkTheme;
      notifyListeners();
    }
  }

  switchTheme() {
    isDark() ? switchToLight() : switchToDark();
    notifyListeners();
  }

  ThemeData getTheme() {
    return this._theme;
  }

  Color getOnColor() {
    return isDark() ? onDark : onLight;
  }

  IconData getSwitcherIcon() {
    return isDark() ? Icons.wb_sunny : Icons.nightlight_round;
  }
}
