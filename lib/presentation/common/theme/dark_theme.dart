import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../const.dart';

class AppDarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      cardTheme: const CardTheme(color: Colors.black, elevation: 0.0),
      buttonBarTheme:
          const ButtonBarThemeData(alignment: MainAxisAlignment.spaceAround),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),

      /* floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.blue.shade100),
        ),
        elevation: 0.0,
      ),*/
      scaffoldBackgroundColor: Colors.black,
      primaryTextTheme: TextTheme(
        headline6: GoogleFonts.robotoFlex(),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.robotoFlex(
          fontSize: 97,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: GoogleFonts.robotoFlex(
          fontSize: 61,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        headline3: GoogleFonts.robotoFlex(
          fontSize: 48,
          fontWeight: FontWeight.w300,
        ),
        headline4: GoogleFonts.robotoFlex(
          fontSize: 34,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.25,
        ),
        headline5: GoogleFonts.robotoFlex(
          fontSize: 24,
          fontWeight: FontWeight.w300,
        ),
        headline6: GoogleFonts.robotoFlex(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.robotoFlex(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.25,
        ),
        button: GoogleFonts.robotoFlex(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.25,
        ),
        caption: GoogleFonts.robotoFlex(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.4,
        ),
        overline: GoogleFonts.robotoFlex(
          fontSize: 10,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.5,
        ),
      ),
      /*inputDecorationTheme: InputDecorationTheme(
        iconColor: Colors.blue.shade200,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(38.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade50),
          borderRadius: BorderRadius.circular(38.0),
        ),
        filled: true,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.black,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.blue.shade100),
        ),
        labelPadding: const EdgeInsets.all(8.0),
        selectedColor: Colors.blue.shade100,
      ),
     */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: mainDarkThemeColor,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: rippleColor,
          side: const BorderSide(color: Colors.transparent),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(38.0),
            ),
          ),
        ),
      ),
    );
  }
}
