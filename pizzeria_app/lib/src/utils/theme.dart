import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
      // canvasColor: Colors.red,
      // primaryColor: Colors.red,
      fontFamily: GoogleFonts.poppins().fontFamily,
      // scaffoldBackgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
          // primary: Colors.red,
          //       secondary: Colors.red,
          //       background: Colors.red,
          //       surface: Colors.red,
          //       onBackground: Colors.red,
          //       onSurface: Colors.red,
          //       onPrimary: Colors.red

          //       // primarySwatch: Colors.blue,
          //       )
          //   .copyWith(
          // background: Colors.red,
          // surface: Colors.red,
          // primary: Colors.red,
          // secondary: Colors.red,
          ));
}
