import 'dart:ui';

import 'package:e_pack_final/core/core_usage/presentation/configurations/sizes.dart';
import 'package:flutter/material.dart';

//Surface
const kSurfaceColor = Color(0xFFE8E832);

//Primary
const kPrimaryColor = Color(0xFFed9121);
const kPrimaryVariantColor = Color(0xFFCBA923);
const kPrimaryVariantDarkColor = Color(0xFFCBA923);
const kPrimaryDarkColor = Color(0xFF936B39);

//Secondary
const kSecondaryVariantColor = Color(0xFFffdf00);
const kSecondaryColor = Color(0xffc1ab0f);
const kSecondaryVariantDarkColor = Color(0xFFDEDDDD);
const kSecondaryDarkColor = Color(0xFF29303E);

// Error Colors
const kErrorLightColor = Color(0xFFC11F1F);
const kErrorDarkColor = Color(0xFF7F1B1B);

// Background Colours
const kBackgroundLightColor = Color(0xFFD9D9E5);
const kBackgroundDarkColor = Color(0xFFD9D9E5);


var border = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.black54),
  borderRadius: BorderRadius.circular(
    itemHeight(10),
  ),
);

inputDecoration(
    BuildContext context,
    ) =>
    InputDecoration(filled: true, border: border, errorBorder: border, disabledBorder: border, focusedBorder: border, focusedErrorBorder: border);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kBackgroundLightColor,
  primaryColor: kPrimaryColor,
  // appBarTheme: AppBarTheme(color: kPrimaryColor, systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: kPrimaryColor)),
  colorScheme: const ColorScheme(
      primary: kPrimaryColor,
      primaryVariant: kPrimaryVariantColor,
      secondary: kSecondaryColor,
      secondaryVariant: kSecondaryVariantColor,
      surface: kSurfaceColor,
      background: kBackgroundLightColor,
      error: kErrorLightColor,
      onPrimary: kPrimaryColor,
      onSecondary: kSecondaryColor,
      onSurface: kSurfaceColor,
      onBackground: kBackgroundLightColor,
      onError: kErrorLightColor,
      brightness: Brightness.light),
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 35.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 30.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    headline3: TextStyle(
      fontSize: 25.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 17.0,
    ),
    bodyText2: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: kBackgroundDarkColor,
  primaryColor: kPrimaryDarkColor,
  colorScheme: const ColorScheme(
      primary: kPrimaryDarkColor,
      primaryVariant: kPrimaryVariantDarkColor,
      secondary: kSecondaryDarkColor,
      secondaryVariant: kSecondaryVariantDarkColor,
      surface: kSurfaceColor,
      background: kBackgroundDarkColor,
      error: kErrorDarkColor,
      onPrimary: kPrimaryDarkColor,
      onSecondary: kSecondaryDarkColor,
      onSurface: kSurfaceColor,
      onBackground: kBackgroundLightColor,
      onError: kErrorLightColor,
      brightness: Brightness.light),
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 35.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 30.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    headline3: TextStyle(
      fontSize: 25.0,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 17.0,
    ),
    bodyText2: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  ),
);
