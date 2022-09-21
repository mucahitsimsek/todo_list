import 'package:flutter/material.dart';

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

  ThemeData _selectedThemeData = ThemeData(
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

  void switchTheme(bool selected) {
    _selectedThemeData = selected ? _redTheme : _greenTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
