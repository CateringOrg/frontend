import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColor.primaryBackground,
    canvasColor: AppColor.secondaryBackground,
    cardColor: AppColor.secondaryBackground,
    dialogBackgroundColor: AppColor.secondaryBackground,

    dividerColor: AppColor.accent,
    shadowColor: AppColor.shadow,
    splashColor: AppColor.accent,

    disabledColor: AppColor.secondary,
    focusColor: AppColor.secondary,
    highlightColor: AppColor.secondary,
    hoverColor: AppColor.secondary,
    indicatorColor: AppColor.secondary,

    primaryColor: AppColor.primary,
    primaryColorDark: AppColor.primaryBlack,
    primaryColorLight: AppColor.primaryWhite,

    secondaryHeaderColor: AppColor.fontDark,

    fontFamily: AppTextThemes.mainFontFamily,
    primaryTextTheme: AppTextThemes.mainTextTheme,
    textTheme: AppTextThemes.mainTextTheme,

    elevatedButtonTheme: AppWidgetsThemes.mainElevatedButtonTheme,
    // TODO: fontFamilyFallback
  );

  static ThemeData dark = light;
}

class AppTextThemes {
  static const String mainFontFamily = 'Lato';

  static const TextStyle defaultTextStyle = TextStyle(
    color: AppColor.fontDark,
    fontSize: 16,
    fontFamily: mainFontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle headline = TextStyle(
    fontSize: 40,
    color: AppColor.fontEmphasis,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineaccent = TextStyle(
    fontSize: 40,
    color: AppColor.accent,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle smallheadline = TextStyle(
    fontSize: 32,
    color: AppColor.fontEmphasis,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle heading = TextStyle(
    fontSize: 24,
    color: AppColor.fontEmphasis,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headingblack = TextStyle(
    fontSize: 24,
    color: AppColor.fontDark,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headingaccent = TextStyle(
    fontSize: 24,
    color: AppColor.accent,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headinggrey = TextStyle(
      fontSize: 24,
      color: AppColor.fontEmphasisGrey,
      fontStyle: FontStyle.italic);

  static TextStyle headingweak = TextStyle(
    fontSize: 24,
    color: AppColor.withOpacity(AppColor.fontDark, 0.5),
  );

  static const TextStyle subheading = TextStyle(
      fontSize: 20,
      color: AppColor.fontEmphasisGrey,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic);

  static TextStyle subheadingweak = TextStyle(
      fontSize: 20,
      color: AppColor.withOpacity(AppColor.fontDark, 0.5),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic);

  static const TextStyle body = TextStyle(
    fontSize: 20,
    color: AppColor.fontDark,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle emphasis = TextStyle(
    fontWeight: FontWeight.w600,
  );

  static const TextStyle smallemphasis = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static TextStyle weak = TextStyle(
    color: AppColor.withOpacity(AppColor.fontDark, 0.5),
  );

  static TextStyle smallweak = TextStyle(
    color: AppColor.withOpacity(AppColor.fontDark, 0.5),
    fontSize: 12,
  );

  static const TextStyle smallgrey = TextStyle(
    fontSize: 12,
    color: AppColor.fontEmphasisGrey,
  );

  static TextStyle quote = TextStyle(
    color: AppColor.withOpacity(AppColor.fontDark, 0.5),
    fontStyle: FontStyle.italic,
  );

  static const TextStyle link = TextStyle();

  static const TextStyle button = TextStyle();

  static TextTheme mainTextTheme = const TextTheme(
    displayLarge: heading,
    displayMedium: subheading,
    displaySmall: body,
    headlineLarge: subheading,
    headlineMedium: subheading,
    headlineSmall: body,
    titleLarge: subheading,
    titleMedium: body,
    titleSmall: body,
    bodyLarge: subheading,
    bodyMedium: body,
    bodySmall: body,
    labelLarge: subheading,
    labelMedium: body,
    labelSmall: body,
  );
}

class AppWidgetsThemes {
  static MaterialColor mainButtonColor =
      AppColor.generateMaterialColor(AppColor.secondary);

  static ButtonStyle mainButtonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(AppWidgetsThemes.mainButtonColor),
    foregroundColor: MaterialStateProperty.all<Color>(AppColor.primary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0), // TODO replace with const
    )),
    textStyle: MaterialStateProperty.all<TextStyle>(AppTextThemes.button),
  );

  static ElevatedButtonThemeData mainElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: mainButtonStyle,
  );
}
