import 'dart:io';

import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/home_screen.dart';
import 'package:e_pack/features/log_in/presentation/pages/log_in.dart';
import 'package:e_pack/features/log_in/presentation/provider/login_info_provider.dart';
import 'package:e_pack/injector.dart' as di;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/presentation/home_screen_data.dart';
import 'core/presentation/routes.dart';

void main() async {
  await di.init();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => HomeScreenData()),
        ChangeNotifierProvider(create: (BuildContext context) => LoginInfo()),
      ],
      child: (Platform.isAndroid)
          ? MaterialApp(
              theme: lightTheme,
              routes: routes,
              initialRoute: LogIn.id,
            )
          : CupertinoApp(
              routes: routes,
              initialRoute: HomeScreen.id,
            ),
    );
  }
}
