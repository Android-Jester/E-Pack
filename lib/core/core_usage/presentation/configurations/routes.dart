
import 'package:e_pack_final/core/core_usage/presentation/screen/terms_and_conditions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../features/delivery_option/presentation/delivery_option.dart';
import '../../../../features/log_in/presentation/pages/log_in.dart';
import '../../../../features/sign_up/presentation/pages/sign_up.dart';
import '../../../../features/storage_option/presentation/storage_option.dart';
import '../screen/HomeScreen.dart';
import '../screen/splash_screen.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  SplashScreen.id: (context) => SplashScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  TermsAndConditions.id: (context) => TermsAndConditions(),
  StorageOption.id: (context) => StorageOption(),
  DeliveryOption.id: (context) => DeliveryOption(),
  LogIn.id: (context) => LogIn(),
  SignUp.id: (context) => SignUp(),
};
