import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const backgroundColor = Color.fromARGB(255, 46, 196, 182);

const textIconColor = Color.fromARGB(255, 246, 247, 248);

const secondaryColor = Color.fromARGB(255, 32, 164, 243);

const accentColor = Color.fromARGB(255, 247, 202, 2);

const primaryColor = Color.fromARGB(230, 20, 20, 20);

final onPrimaryColorText = GoogleFonts.dmSans(
  color: textIconColor,
  fontSize: 22,
  fontStyle: FontStyle.italic,
);

final onPrimaryColorBodyText = GoogleFonts.dmSans(
  color: textIconColor,
  fontSize: 18,
  fontStyle: FontStyle.normal,
);

final secondaryColorScheme = ColorScheme.fromSeed(
  seedColor: secondaryColor,
  brightness: Brightness.light,
);

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.dmSansTextTheme(),
);
