import 'dart:io';

import 'package:e_pack_final/core/core_usage/presentation/screen/HomeScreen.dart';
import 'package:e_pack_final/core/core_usage/presentation/screen/splash_screen.dart';
import 'package:e_pack_final/features/delivery_option/presentation/delivery_option.dart';
import 'package:e_pack_final/features/sign_up/domain/repositories/registering_user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core_usage/presentation/configurations/routes.dart';
import 'core/core_usage/presentation/configurations/theme.dart';
import 'features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import 'features/log_in/domain/repositories/auth_repo.dart';
import 'features/log_in/presentation/provider/login_cubit.dart';
import 'features/sign_up/presentation/provider/sign_up_cubit.dart';
import 'features/storage_option/presentation/provider/bloc/storage_cubit.dart';
import 'features/storage_option/presentation/storage_option.dart';
import 'injector.dart';

Future<void> main() async {
  await start(); //starts the service locator
  runApp(EPack()); //runs the application
}

class EPack extends StatelessWidget {
  const EPack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator.get<SignUpCubit>()), //setup cubit for the entire project
          BlocProvider(create: (_) => locator.get<LoginCubit>()), //setup cubit for the entire project
          BlocProvider(create: (_) => locator.get<StorageCubit>()), //setup cubit for the entire project
          BlocProvider(create: (_) => locator.get<DeliveryCubit>()), //setup cubit for the entire project
        ],
        child: (Platform.isAndroid)
            ? MaterialApp(
                theme: lightTheme,
                darkTheme: darkTheme,
                routes: routes,
          home: HomeScreen(),
                // home: (locator.get<AuthRepo>().username == '' || locator.get<RegisterRepo>().username == '' ) ? const SplashScreen(): HomeScreen(),
              )
            : const CupertinoApp(home: SplashScreen()));
  }
}
