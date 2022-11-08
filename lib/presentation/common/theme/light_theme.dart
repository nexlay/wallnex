import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      //useMaterial3: true,
      iconTheme: const IconThemeData(
        color: mainColor,
      ),
      buttonBarTheme:
          const ButtonBarThemeData(alignment: MainAxisAlignment.spaceAround),
      cardTheme: const CardTheme(elevation: 0.0),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: mainColor),
        iconTheme: IconThemeData(
          color: mainColor,
        ),
      ),
      /* bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade300,
        elevation: 0.0,
        selectedItemColor: rippleColor,
      ),*/
      /*floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.blue.shade100),
        ),
        elevation: 0.0,
      ),*/
      primaryTextTheme: TextTheme(
        headline6: GoogleFonts.robotoFlex(
          color: mainColor,
        ),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.robotoFlex(
            fontSize: 97,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            color: mainColor),
        headline2: GoogleFonts.robotoFlex(
            fontSize: 61,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            color: mainColor),
        headline3: GoogleFonts.robotoFlex(
            fontSize: 48, fontWeight: FontWeight.w300, color: mainColor),
        headline4: GoogleFonts.robotoFlex(
            fontSize: 34,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.25,
            color: mainColor),
        headline5: GoogleFonts.robotoFlex(
            fontSize: 24, fontWeight: FontWeight.w300, color: mainColor),
        headline6: GoogleFonts.robotoFlex(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.15,
            color: mainColor),
        subtitle1: GoogleFonts.robotoFlex(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.15,
            color: mainColor),
        subtitle2: GoogleFonts.robotoFlex(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.1,
            color: mainColor),
        bodyText1: GoogleFonts.robotoFlex(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: mainColor),
        bodyText2: GoogleFonts.robotoFlex(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.25,
            color: mainColor),
        button: GoogleFonts.robotoFlex(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.25,
            color: mainColor),
        caption: GoogleFonts.robotoFlex(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.4,
            color: mainColor),
        overline: GoogleFonts.robotoFlex(
            fontSize: 10,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
            color: mainColor),
      ),
      /*inputDecorationTheme: InputDecorationTheme(
        iconColor: Colors.blue.shade200,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade50),
          borderRadius: BorderRadius.circular(38.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade50),
          borderRadius: BorderRadius.circular(38.0),
        ),
        filled: true,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
        fillColor: Colors.blue.shade50,
      ),*/

      /* chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.blue.shade100),
        ),
        labelPadding: const EdgeInsets.all(8.0),
        selectedColor: Colors.blue.shade100,
      ),*/
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: mainColor),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorSelected,
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
