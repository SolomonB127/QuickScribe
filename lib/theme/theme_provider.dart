import 'package:flutter/material.dart';
import 'package:quick_scribe/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
// light mode- starting theme
  ThemeData _themeData = lightmode;

// getter method to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

// getter method to check if we are in dark mode or not
  bool get isDarkMode => _themeData == darkmode;

// setter to set the new theme
  set themeData(ThemeData themeDate) {
    _themeData = themeDate;
    notifyListeners();
  }

// to switch between modes
  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}
