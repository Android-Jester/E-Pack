import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:e_pack/core/presentation/pages/splash_screen.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/presentation/provider/home_screen_data.dart';
import 'core/presentation/routes.dart';
import 'features/log_in/presentation/provider/login_info_provider.dart';
import 'features/sign_up/presentation/provider/login_info_provider.dart';

void main() async {
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
        ChangeNotifierProvider(create: (BuildContext context) => HomeScreenData()),
        ChangeNotifierProvider(create: (BuildContext context) => LoginInfo()),
        ChangeNotifierProvider(create: (BuildContext context) => SignupInfo()),
      ],
      child: (Platform.isAndroid)
          ? MaterialApp(
              theme: lightTheme,
              routes: routes,
              home: FutureBuilder(
                  future: Account(AppWriteServer.initClient()).get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return HomeScreen();
                    } else if (snapshot.hasError) {
                      return SplashScreen();
                    } else {
                      return Scaffold(body: Center(child: CircularProgressIndicator()));
                    }
                  }),
            )
          : CupertinoApp(
              routes: routes,
              home: FutureBuilder(
                  future: Account(AppWriteServer.initClient()).get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return HomeScreen();
                    } else if (snapshot.hasError) {
                      return SplashScreen();
                    } else {
                      return Scaffold(body: Center(child: CircularProgressIndicator()));
                    }
                  }),
            ),
    );
  }
}
