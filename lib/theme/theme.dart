import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary
const primaryColor = Color.fromARGB(255, 46, 196, 182);

// Background / Surface
const backgroundColor = Color.fromARGB(255, 246, 247, 248);

// Secondary
const secondaryColor = Color.fromARGB(255, 32, 164, 243);

// Accent / Error
const accentColor = Color.fromARGB(255, 202, 60, 37);

// Text / Icons
const textIconColor = Color.fromARGB(255, 29, 26, 5);

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

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
  textTheme: GoogleFonts.dmSansTextTheme(),
);
