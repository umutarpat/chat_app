import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    // Flutter uses roboto by default already, but we can override it with our own font in the future when necessary
    // if gets the font through assets, this way online internet connection will not be necessary if we change the font in future.
    fontFamily: 'roboto',
    textTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.black, fontSize: 12),
      titleMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(color: Colors.black, fontSize: 18),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );
}
