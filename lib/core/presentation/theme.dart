import 'dart:ui';

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFB06B15);
const kPrimaryDarkColor = Color(0xFF936B39);
const kAccentColor = Color(0xFFBDBDBD);
const kAccentDarkColor = Color(0xFF29303E);
const kBackgroundColor = Color(0xFFD9D9E5);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryColor,
  secondaryHeaderColor: kAccentColor,
  fontFamily: "Roboto",
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 34.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
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
