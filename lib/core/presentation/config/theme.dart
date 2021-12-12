import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'config.dart';

var border = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black54),
  borderRadius: BorderRadius.circular(
    itemHeight(10),
  ),
);

inputDecoration(
  BuildContext context,
) =>
    InputDecoration(
        filled: true,
        fillColor: Colors.purple[200],
        border: border,
        errorBorder: border,
        disabledBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border);

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
