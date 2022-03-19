import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData theme() {
    return ThemeData(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      primaryColor: const Color.fromRGBO(255, 79, 0, 1),
      primaryColorDark: const Color.fromRGBO(14, 14, 14, 1),
      dialogBackgroundColor: const Color.fromRGBO(176, 179, 183, 1),
      fontFamily: 'Lato',
      textTheme: const TextTheme(
        headline3: TextStyle(
          color: Color.fromRGBO(14, 14, 14, 1),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
