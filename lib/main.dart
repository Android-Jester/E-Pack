import 'dart:io';

import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/presentation/provider/home_screen_data.dart';
import 'core/presentation/routes.dart';
import 'features/storage_option/presentation/storage_option.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenData(),
      child: (Platform.isAndroid)
          ? MaterialApp(
              theme: lightTheme,
              routes: routes,
              initialRoute: StorageOption.id,
            )
          : CupertinoApp(
              routes: routes,
              initialRoute: HomeScreen.id,
            ),
    );
  }
}
