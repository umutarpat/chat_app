import 'package:flutter/material.dart';

const _primaryColor = Colors.blue;

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: _primaryColor,
    colorScheme: ColorScheme.fromSeed(
      // on surface: if background is white, use it
      primary: _primaryColor,
      onSurface: Colors.blue,
      seedColor: Colors.blue,
    ),
    // Flutter uses roboto by default already, but we can override it with our own font in the future when necessary
    // if gets the font through assets, this way online internet connection will not be necessary if we change the font in future.
    fontFamily: 'roboto',
    textTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.black, fontSize: 12),
      titleMedium: TextStyle(fontSize: 16, color: Colors.white),
      titleLarge: TextStyle(color: Colors.black, fontSize: 18),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );
}
