import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'config.dart';

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
colorScheme: lightColorScheme,
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
  colorScheme: darkColorScheme,
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
