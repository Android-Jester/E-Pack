import 'package:e_pack/core/presentation/config/colors.dart';
import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/log_in/presentation/pages/log_in.dart';
import 'package:e_pack/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String id = "splash";
  const SplashScreen({Key? key}) : super(key: key);

  Widget buttonColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(5.0), vertical: itemHeight(40.0)),
      width: Config.width,
      child: Column(
        children: [
          CustomButton(
            text: "Login",
            onPressed: () => Navigator.popAndPushNamed(context, LogIn.id),
            color: Colors.black.withOpacity(0.7),
          ),
          SizedBox(height: itemHeight(15.0)),
          CustomButton(
            text: "Sign Up",
            onPressed: () => Navigator.popAndPushNamed(context, SignUp.id),
            color: Colors.white.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
