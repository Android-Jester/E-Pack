import 'package:flutter/material.dart';

import 'core/presentation/home_screen.dart';
import 'core/presentation/terms_and_conditions.dart';
import 'features/SignUp/presentation/pages/signup_screen.dart';
import 'features/delivery_option/presentation/pages/delivery_option.dart';
import 'features/login/presentation/pages/login_screen.dart';
import 'features/storage_option/presentation/pages/storage_option/storage_option.dart';

Map<String, WidgetBuilder>? routes = {
  LoginScreen.id: (context) => LoginScreen(),
  SignUpScreen.id: (context) => SignUpScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  StorageOption.id: (context) => StorageOption(),
  DeliveryOption.id: (context) => DeliveryOption(),
  TandC.id: (context) => TandC(),
};
