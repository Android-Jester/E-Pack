import 'dart:io' show Platform;

import 'package:e_pack/features/SignUp/presentation/pages/login_screen.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/requestBuilder/presentation/pages/home_screen.dart';
import 'features/requestBuilder/presentation/pages/page1/page_1.dart';
import 'features/requestBuilder/presentation/pages/page3.dart';

void main() => runApp(const EPackServices());

class EPackServices extends StatelessWidget {
  const EPackServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Platform.isAndroid)
        ? MaterialApp(
            theme: ThemeData(
                textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  decoration: TextDecoration.underline),
              button: TextStyle(fontSize: 12.0, color: Colors.white),
            )),
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.id,
            routes: {
              LoginScreen.id: (context) => LoginScreen(),
              // SignUpScreen.id: (context) => SignUpScreen(),
              HomeScreen.id: (context) => HomeScreen(),
              Page1.id: (context) => const Page1(),
              Page2.id: (context) => Page2(),
              TandC.id: (context) => TandC(),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.id,
            routes: {
              HomeScreen.id: (context) => HomeScreen(),
              // Page1.id: (context) => const Page1(),
              // Page2.id: (context) => const Page2(),
              // Page3.id: (context) => const Page3(),
            },
          );
  }
}
