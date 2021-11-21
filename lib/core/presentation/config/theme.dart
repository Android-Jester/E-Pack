import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'config.dart';

var border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(
    itemHeight(10),
  ),
);

var inputDecoration = InputDecoration(
    border: border,
    errorBorder: border,
    disabledBorder: border,
    focusedBorder: border,
    focusedErrorBorder: border);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryColor,
  secondaryHeaderColor: kAccentColor,
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
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryDarkColor,
  secondaryHeaderColor: kAccentDarkColor,
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 34.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 20.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
  ),
);
