import 'package:e_pack_final/features/log_in/presentation/pages/log_in.dart';
import 'package:e_pack_final/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

import '../../configurations/sizes.dart';
import '../custom_button.dart';

class ButtonColumn extends StatelessWidget {
  const ButtonColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = itemWidth(400);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: itemWidth(15.0), vertical: itemHeight(40.0)),
      width: Config.width,
      child: Column(
        children: [
          CustomButton(
            width: width,
            text: "Login",
            onPressed: () => Navigator.popAndPushNamed(context, LogIn.id),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          SizedBox(height: itemHeight(15.0)),
          CustomButton(
            width: width,
            text: "Sign Up",
            onPressed: () => Navigator.popAndPushNamed(context, SignUp.id),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ],
      ),
    );
  }
}
