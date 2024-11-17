import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../const/const.dart';

class AppDarkTheme {
  static ThemeData darkTheme(ColorScheme colorScheme, BuildContext context) =>
      ThemeData(
        colorScheme: colorScheme,
        disabledColor: Colors.grey,
        brightness: Brightness.dark,
        cardTheme: CardTheme(
          color: colorScheme.onPrimary,
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
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) => const TextStyle(fontSize: 14),
          ),
          height: 80,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0.0,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        primaryTextTheme: TextTheme(
          titleLarge: GoogleFonts.notoSans(),
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.notoSans(
            fontSize: 97,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          displayMedium: GoogleFonts.notoSans(
            fontSize: 61,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          displaySmall: GoogleFonts.notoSans(
            fontSize: 48,
            fontWeight: FontWeight.w300,
          ),
          headlineMedium: GoogleFonts.notoSans(
            fontSize: 34,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.25,
          ),
          headlineSmall: GoogleFonts.notoSans(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
          titleLarge: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.15,
          ),
          titleMedium: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.15,
          ),
          titleSmall: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.1,
          ),
          bodyLarge: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.25,
          ),
          labelLarge: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.25,
          ),
          bodySmall: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.4,
          ),
          labelSmall: GoogleFonts.notoSans(
            fontSize: 10,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
          ),
        ),
        listTileTheme: ListTileThemeData(
          titleTextStyle: const TextStyle(fontSize: kFontSizeMid),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
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
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(32.0),
          ),
          filled: true,
        ),
        popupMenuTheme: PopupMenuThemeData(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kFontSizeMid),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - 100,
                MediaQuery.of(context).size.height / kRadius),
            backgroundColor: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - 100,
                MediaQuery.of(context).size.height / kFontSizeMid),
          ),
        ),
      );
}
