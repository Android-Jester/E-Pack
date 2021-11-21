import 'package:e_pack/features/delivery_option/presentation/Screens/momo_information.dart'
    as delivery;
import 'package:e_pack/features/delivery_option/presentation/delivery_option.dart';
import 'package:e_pack/features/storage_option/presentation/storage_option.dart';
import 'package:flutter/material.dart';

import 'pages/home_screen.dart';
import 'pages/terms_and_conditions.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  // SplashScreen.id: (context) => SplashScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  TandC.id: (context) => TandC(),
  StorageOption.id: (context) => StorageOption(),
  DeliveryOption.id: (context) => DeliveryOption(),
  // LogIn.id: (context) => LogIn(),
  // SignUp.id: (context) => SignUp(),
  delivery.MomoInformation.id: (context) => delivery.MomoInformation(),
  // storage.MomoInformation.id: (context) => storage.MomoInformation(),
};
