import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);

List<ThemeData> getThemes() {
  return [
    ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
        scaffoldBackgroundColor: Color(0xfff1f1f1)),
    ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.indigo,
      accentColor: Colors.pink,
    ),
  ];
}
