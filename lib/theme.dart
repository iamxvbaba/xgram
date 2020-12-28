import 'package:flutter/material.dart';

List<ThemeData> getThemes() {
  return [
    ThemeData(
      primaryColor: Colors.grey[200],
      accentColor: Colors.grey[200],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
      )
    ),
    ThemeData(
      primaryColor: Colors.blue[200],
      accentColor: Colors.cyan[500],
    ),
  ];
}
