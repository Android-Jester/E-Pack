import 'dart:io';

import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/pages/splash_screen.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/presentation/provider/home_screen_data.dart';
import 'core/presentation/routes.dart';
import 'features/log_in/presentation/provider/login_info_provider.dart';
import 'features/sign_up/presentation/provider/SignUp_info.dart';
import 'injector.dart';

void main() async {
  runApp(const MyApp());
  await start();
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
        BlocProvider(create: (context) => DeliveryCubit(deliveryRequest: locator.get<SendDeliveryRequest>())),
        ChangeNotifierProvider(create: (BuildContext context) => HomeScreenData()),
        ChangeNotifierProvider(create: (BuildContext context) => LoginInfo()),
        ChangeNotifierProvider(create: (BuildContext context) => SignupInfo()),
      ],
      child: (Platform.isAndroid)
          ? MaterialApp(
              themeMode: ThemeMode.light,
              theme: lightTheme,
              darkTheme: darkTheme,
              routes: routes,
            )
          : CupertinoApp(
              routes: routes,
              home: FutureBuilder(builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const SplashScreen();
                } else {
                  return const Scaffold(body: Center(child: CircularProgressIndicator()));
                }
              }),
            ),
    );
  }
}