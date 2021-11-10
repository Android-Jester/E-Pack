import 'package:e_pack/features/delivery_option/presentation/delivery_option.dart';
import 'package:e_pack/features/log_in/presentation/pages/log_in.dart';
import 'package:e_pack/features/sign_up/presentation/pages/sign_up.dart';
import 'package:e_pack/features/storage_option/presentation/storage_option.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'terms_and_conditions.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  HomeScreen.id: (context) => HomeScreen(),
  TandC.id: (context) => TandC(),
  StorageOption.id: (context) => StorageOption(),
  DeliveryOption.id: (context) => DeliveryOption(),
  LogIn.id: (context) => LogIn(),
  SignUp.id: (context) => SignUp(),
  //MomoPayment.id: (context) => MomoPayment(),
};
