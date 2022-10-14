import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/storage_manager.dart';
import 'package:gofit/config/theme.dart';

class ThemeNotifier with ChangeNotifier {
  static final darkTheme = AppTheme.dark();

  static final lightTheme = AppTheme.light();

  ThemeData? _themeData;
  ThemeData? getTheme() => lightTheme;
  //  _themeData;

  ThemeNotifier() {
    StorageManager.readData(themeModePrefKey).then((value) {
      if (kDebugMode) print('value read from storage: $value');
      var themeMode = value ?? lightModePrefValue;
      if (themeMode == lightModePrefValue) {
        _themeData = lightTheme;
      } else {
        if (kDebugMode) print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData(themeModePrefKey, darkModePrefValue);
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData(themeModePrefKey, lightModePrefValue);
    notifyListeners();
  }
}
