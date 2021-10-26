import 'dart:io' show Platform;

import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/presentation/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var client = AppWriteServer().initClient();
  bool isAuth = false;
  // await server.Account(client)
  //     .get()
  //     .then((value) => (value == 200) ? isAuth = true : isAuth = false)
  //     .catchError((err) {
  //   print(err);
  // });

  List<Provider>? providers = [];

  runApp(
    (Platform.isAndroid)
        ? MaterialApp(
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.id,
            routes: routes!)
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.id,
            routes: routes!),
  );
}
