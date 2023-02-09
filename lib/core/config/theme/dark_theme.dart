import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: Colors.redAccent,
      brightness: Brightness.dark,
      useMaterial3: true,
      cardTheme: CardTheme(
        color: Colors.black.withOpacity(0.7),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
      ),
      buttonBarTheme: const ButtonBarThemeData(
        alignment: MainAxisAlignment.spaceAround,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      navigationBarTheme: NavigationBarThemeData(

        labelTextStyle: MaterialStateProperty.resolveWith((states) => const TextStyle(fontSize: 14),),
        height: 80,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 0.0,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      scaffoldBackgroundColor: Colors.black,
      primaryTextTheme: TextTheme(
        titleLarge: GoogleFonts.robotoFlex(),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.robotoFlex(
          fontSize: 97,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        displayMedium: GoogleFonts.robotoFlex(
          fontSize: 61,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        displaySmall: GoogleFonts.robotoFlex(
          fontSize: 48,
          fontWeight: FontWeight.w300,
        ),
        headlineMedium: GoogleFonts.robotoFlex(
          fontSize: 34,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.25,
        ),
        headlineSmall: GoogleFonts.robotoFlex(
          fontSize: 24,
          fontWeight: FontWeight.w300,
        ),
        titleLarge: GoogleFonts.robotoFlex(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.15,
        ),
        titleMedium: GoogleFonts.robotoFlex(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.15,
        ),
        titleSmall: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.1,
        ),
        bodyLarge: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
        ),
        bodyMedium: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.25,
        ),
        labelLarge: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.25,
        ),
        bodySmall: GoogleFonts.robotoFlex(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.4,
        ),
        labelSmall: GoogleFonts.robotoFlex(
          fontSize: 10,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.5,
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(32.0),
        ),
        filled: true,
      ),
    );
  }
}
