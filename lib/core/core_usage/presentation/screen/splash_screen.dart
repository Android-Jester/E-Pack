import 'package:e_pack_final/core/core_usage/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../features/log_in/presentation/pages/log_in.dart';
import '../../../../features/sign_up/presentation/pages/sign_up.dart';
import '../configurations/sizes.dart';
import '../widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  static String id = "splash";
  SplashScreen({Key? key}) : super(key: key) {
    // print("LOGIN USERNAME: " + locator.get<AuthRepo>().username!);
    print("REGISTER USERNAME: " + username);
  }

  Widget buttonColumn(BuildContext context) {
    Config.init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Theme.of(context).colorScheme.primary));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(15.0), vertical: itemHeight(40.0)),
      width: Config.width,
      child: Column(
        children: [
          CustomButton(
            width: itemWidth(400),
            text: "Login",
            onPressed: () => Navigator.pushNamed(context, LogIn.id),
            color: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(height: itemHeight(15.0)),
          CustomButton(
            width: itemWidth(400),
            text: "Sign Up",
            onPressed: () => Navigator.pushNamed(context, SignUp.id),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            "assets/images/Rectangle_1.png",
            width: Config.width!,
            fit: BoxFit.scaleDown,
          ),
          Spacer(),
          buttonColumn(context),
        ],
      ),
    );
  }
}
