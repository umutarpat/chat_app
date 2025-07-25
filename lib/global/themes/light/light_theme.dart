import 'package:chat_app/global/themes/extensions/design_colors.dart';
import 'package:chat_app/global/themes/extensions/design_text_styles.dart';
import 'package:flutter/material.dart';

const _primaryColor = Colors.blue;
const _fieldHintTextStyle = TextStyle(color: Colors.grey, fontSize: 16);
const _fieldErrorTextStyle = TextStyle(color: Colors.red, fontSize: 12);
const _buttonTextStyle = TextStyle(color: Colors.white, fontSize: 14);
const _secondaryButtonTextStyle = TextStyle(color: Colors.blue, fontSize: 14);

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    primaryColor: _primaryColor,
    colorScheme: ColorScheme.fromSeed(
      // on surface: if background is white, use it
      primary: _primaryColor,
      onSurface: Colors.blue,
      onSurfaceVariant: Colors.black,
      seedColor: Colors.blue,
    ),
    // Flutter uses roboto by default already, but we can override it with our own font in the future when necessary
    // if gets the font through assets, this way online internet connection will not be necessary if we change the font in future.
    fontFamily: 'roboto',
    extensions: <ThemeExtension<dynamic>>[
      DesignColors(
        cardColor: Color.fromARGB(255, 232, 235, 240),
        cardSuccessColor: Colors.green.withOpacity(0.8),
        cardErrorColor: Colors.red.withOpacity(0.8),
      ),
      DesignTextStyles(
        fieldHintTextStyle: _fieldHintTextStyle,
        fieldErrorTextStyle: _fieldErrorTextStyle,
        buttonTextStyle: _buttonTextStyle,
        secondaryButtonTextStyle: _secondaryButtonTextStyle,
      ),
    ],
    textTheme: TextTheme(
      titleSmall: TextStyle(color: Colors.black, fontSize: 12),
      titleMedium: TextStyle(fontSize: 16, color: Colors.white),
      titleLarge: TextStyle(color: Colors.black, fontSize: 20),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(iconSize: 24, foregroundColor: Colors.blue),
    ),
    iconTheme: IconThemeData(color: Colors.blue),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: _fieldHintTextStyle,
      errorStyle: _fieldErrorTextStyle,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
