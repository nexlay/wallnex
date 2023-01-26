import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: Colors.redAccent,
      brightness: Brightness.light,
      useMaterial3: true,
      buttonBarTheme:
          const ButtonBarThemeData(alignment: MainAxisAlignment.spaceAround),
      cardTheme: CardTheme(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white.withOpacity(0.7),
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      primaryTextTheme: TextTheme(
        headline6: GoogleFonts.robotoFlex(
            color: Colors.black, fontWeight: FontWeight.w300),
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
          letterSpacing: 0.25, /*color: mainLightThemeColor*/
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
          letterSpacing: 0.15, /* color: mainLightThemeColor*/
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
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}
