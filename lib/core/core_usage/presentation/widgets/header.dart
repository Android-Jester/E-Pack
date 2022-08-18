import 'package:flutter/material.dart';

import '../../../../features/sign_up/presentation/pages/sign_up.dart';
import '../configurations/sizes.dart';

class Header extends StatelessWidget {
  final bool isLogin;

  const Header({
    Key? key,
    this.isLogin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Container(
      height: Config.height! / 2.5,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(itemWidth(30)),
            bottomRight: Radius.circular(itemWidth(30)),
          )),
      child: Stack(
        children: [
          Positioned(
            top: itemHeight(100),
            left: itemWidth(95),
            child: Image.asset(
              "assets/images/Logo.png",
            ),
          ),
          Positioned(
            top: itemHeight(250),
            child: Container(
              width: Config.width,
              padding: EdgeInsets.symmetric(horizontal: itemWidth(25)),
              child: (isLogin)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LOG IN",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: itemWidth(25.0),
                                  color: Colors.white),
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                vertical: itemHeight(8.0),
                                horizontal: itemWidth(8.0)),
                            child: const Text("SIGN UP"),
                          ),
                          onTap: () =>
                              Navigator.popAndPushNamed(context, SignUp.id),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                vertical: itemHeight(8.0),
                                horizontal: itemWidth(8.0)),
                            child: const Text("LOG IN"),
                          ),
                          onTap: () =>
                              Navigator.popAndPushNamed(context, SignUp.id),
                        ),
                        Text(
                          "SIGN UP",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: itemWidth(25.0),
                                  color: Colors.white),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
