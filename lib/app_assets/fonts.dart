import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsInter {
  static TextStyle textStyle({
    Color color = Colors.black,
    double fontSize = 20.0,
    double height = 0.8,
    double letterSpacing = 0.0,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration? decoration,
    Color? decorationColor, // Underline color
    double? decorationThickness, // Thickness of the underline
  }) {
    {
      return GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
      );
    }
  }
}

class GoogleFontsInika {
  static TextStyle textStyle({
    Color color = Colors.black,
    double fontSize = 20.0,
    double height = 0.8,
    double letterSpacing = 0.0,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration? decoration,
    Color? decorationColor, // Underline color
    double? decorationThickness, // Thickness of the underline
  }) {
    {
      return GoogleFonts.inika(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
      );
    }
  }
}
