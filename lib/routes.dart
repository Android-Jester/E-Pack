import 'package:flutter/material.dart';

import 'features/SignUp/presentation/pages/login_screen.dart';
import 'features/requestBuilder/presentation/pages/home_screen.dart';
import 'features/requestBuilder/presentation/pages/page1/page_1.dart';
import 'features/requestBuilder/presentation/pages/page3.dart';
import 'features/requestBuilder/presentation/pages/page_2.dart';

Map<String, WidgetBuilder>? routes = {
  LoginScreen.id: (context) => LoginScreen(),
  // SignUpScreen.id: (context) => SignUpScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  Page1.id: (context) => const Page1(),
  Page2.id: (context) => Page2(),
  TandC.id: (context) => TandC(),
};
