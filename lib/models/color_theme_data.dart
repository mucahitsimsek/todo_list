import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  final ThemeData _greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    colorScheme: ColorScheme.fromSwatch(accentColor: Colors.green),
    appBarTheme: const AppBarTheme(color: Colors.green),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
  );

  final ThemeData _redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    colorScheme: ColorScheme.fromSwatch(accentColor: Colors.red),
    appBarTheme: const AppBarTheme(color: Colors.red),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
  );
  // ignore: unused_field
  bool _isGreen = true;
  static late SharedPreferences _sharedPref;

  void switchTheme(bool selected) {
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  bool get isGreen => _isGreen;
  ThemeData get selectedThemeData => _isGreen ? _redTheme : _greenTheme;

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
    loadThemeFromSharedPref();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPref.setBool('themeData', value);
  }

  void loadThemeFromSharedPref() {
    _isGreen = _sharedPref.getBool('themeData') ?? true;
  }
}
