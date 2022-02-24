import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'core/presentation/config/theme.dart';
import 'core/presentation/provider/home_screen_data.dart';
import 'core/presentation/routes.dart';
import 'features/log_in/presentation/provider/bloc/login_state.dart';
import 'features/log_in/presentation/provider/login_info_provider.dart';
import 'features/sign_up/presentation/provider/SignUp_info.dart';
import 'features/sign_up/presentation/provider/bloc/signup_state.dart';


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
        ChangeNotifierProvider(create: (BuildContext context) => LoginState(context: context)),
        ChangeNotifierProvider(create: (BuildContext context) => SignupInfo()),
        ChangeNotifierProvider(create: (BuildContext context) => SignUpState(context: context)),
      ],
      child: (Platform.isAndroid)
          ? MaterialApp(
              themeMode: ThemeMode.light,
              theme: lightTheme,
              darkTheme: darkTheme,
              routes: routes,
              home: FutureBuilder(
                  future: ,
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
                      return SplashScreen();
                    } else {
                      return Scaffold(body: Center(child: CircularProgressIndicator()));
                    }
                  }),
            ),
    );
  }
}
