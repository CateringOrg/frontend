import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color transparent = Colors.transparent;

  static const Color primary = seasalt;
  static const Color secondary = purple;
  static const Color accent = purple;

  static const secondayGrey = feldgrau;

  static const Color primaryBlack = raisinblack;
  static const Color secondaryBlack = charcoal;
  static const Color primaryWhite = seasalt;
  static const Color secondaryWhite = white;

  static const Color ok = dartmouthgreen;
  static const Color warning = sunglow;
  static const Color error = auburn;

  ////////////////////////////////////////////////
  /////////////////DO NOT CHANGE//////////////////
  ////////////////\\\\\\\\\\\\\\//////////////////

  static const Color primaryBackground = primaryWhite;
  static const Color secondaryBackground = secondaryWhite;

  static const Color shadow = secondary;

  static const Color fontDark = primaryBlack;
  static const Color fontLight = primaryWhite;
  static const Color fontEmphasis = secondary;
  static const Color fontEmphasisGrey = secondayGrey;

  /////////////////^^^^^^^^^^^^^//////////////////
  /////////////////DO NOT CHANGE//////////////////
  ////////////////////////////////////////////////

  static const Color purple = Color(0xff8123ad);
  static const Color platinum = Color(0xffe6e3df);
  static const Color timberwolf = Color(0xffd8d7d4);
  static const Color alabaster = Color(0xffefeee1);
  static const Color seasalt = Color(0xfff8f8f8);
  static const Color white = Color(0xffffffff);
  static const Color raisinblack = Color(0xff29293d);
  static const Color charcoal = Color(0xff40404f);
  static const Color midnightgreen = Color(0xff004953);
  static const Color hunterGreen = Color(0xff294224);
  static const Color feldgrau = Color(0xff434d42);
  static const Color dartmouthgreen = Color(0xff036016);
  static const Color auburn = Color(0xffa62639);
  static const Color hunyadiyellow = Color(0xfff6ae2d);
  static const Color sunglow = Color(0xffffd25a);
  static const Color roseebony = Color(0xff553739);
  static const Color giantsorange = Color(0xffff521b);
  static const Color hookersgreen = Color(0xff70877F);

  static Color withOpacity(Color color, double opacity) =>
      Color(color.value & 0x00FFFFFF | ((opacity * 0xFF).toInt() << 24));

  static MaterialColor generateMaterialColor(Color color) {
    final List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (final double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 0xFF).toInt()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (0xFF - r)) * ds).round(),
        g + ((ds < 0 ? g : (0xFF - g)) * ds).round(),
        b + ((ds < 0 ? b : (0xFF - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
