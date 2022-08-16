import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../configurations/sizes.dart';
import '../widgets/buttons/button_column.dart';

class SplashScreen extends StatelessWidget {
  static String id = "splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            "assets/images/Logo.png",
            width: Config.width!,
            fit: BoxFit.scaleDown,
          ),
          const Spacer(),
          const ButtonColumn(),
        ],
      ),
    );
  }
}
