import 'package:flutter/material.dart';

import '../../../constants/enums/cache_enum_keys.dart';
import '../../cache/shared/shared_manager.dart';
import '../../cache/shared/shared_object.dart';

class ThemeProvider extends ChangeNotifier {
  SharedManager? sharedManager;
  bool? isDarkTheme;

  ThemeProvider() {
    sharedManager = SharedManager(SharedPrefObject.instance?.getSharedObject);
    setTheme();
  }

  void setTheme() {
    isDarkTheme = sharedManager?.getBool(CacheEnumKeys.THEME.name);
    notifyListeners();
  }

  void changeTheme(bool value) {
    isDarkTheme = value;
    notifyListeners();
  }

  ThemeData get getThemeData => (isDarkTheme ?? false) ? ThemeData.dark() : ThemeData.light();
}
