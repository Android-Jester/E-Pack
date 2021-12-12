import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

class ContainerHeader extends StatelessWidget {
  final bool isLogin;

  const ContainerHeader({
    Key? key,
    this.isLogin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Container(
      height: Config.height! / 2.5,
      color: Theme.of(context).colorScheme.primary,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: itemHeight(35),
              left: itemWidth(15),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
                  radius: itemWidth(24),
                  child: Padding(
                    padding: EdgeInsets.only(left: itemWidth(8)),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              )),
          Positioned(
            top: itemHeight(100),
            left: itemWidth(105),
            child: Image.asset(
              "assets/images/Rectangle_1.png",
            ),
          ),
          Positioned(
            top: itemHeight(250),
            child: Container(
              width: Config.width,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: (isLogin)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LOG IN",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(25.0), color: Colors.white),
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(vertical: itemHeight(8.0), horizontal: itemWidth(8.0)),
                            child: Text("SIGN UP"),
                          ),
                          onTap: () => Navigator.popAndPushNamed(context, SignUp.id),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(vertical: itemHeight(8.0), horizontal: itemWidth(8.0)),
                            child: Text("LOG IN"),
                          ),
                          onTap: () => Navigator.popAndPushNamed(context, SignUp.id),
                        ),
                        Text(
                          "SIGN UP",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(25.0), color: Colors.white),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   height: Config.height! / 2.5,
    //   color: Theme.of(context).colorScheme.primary,
    //   width: Config.width,
    //   child: Column(
    //     children: [
    //       Spacer(),
    //       Image.asset(
    //         "assets/images/Rectangle_1.png",
    //       ),
    //       Spacer(),
    //       Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
    //         child: (isLogin)
    //             ? Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "LOG IN",
    //                     style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(25.0), color: Colors.white),
    //                   ),
    //                   GestureDetector(
    //                     child: Container(
    //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    //                       padding: EdgeInsets.symmetric(vertical: itemHeight(8.0), horizontal: itemWidth(8.0)),
    //                       child: Text("SIGN UP"),
    //                     ),
    //                     onTap: () => Navigator.popAndPushNamed(context, LogIn.id),
    //                   ),
    //                 ],
    //               )
    //             : Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   GestureDetector(
    //                     child: Container(
    //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    //                       padding: EdgeInsets.symmetric(vertical: itemHeight(8.0), horizontal: itemWidth(8.0)),
    //                       child: Text("LOGIN"),
    //                     ),
    //                     onTap: () => Navigator.popAndPushNamed(context, LogIn.id),
    //                   ),
    //                   Text(
    //                     "sign Up".toUpperCase(),
    //                     style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(25.0), color: Colors.white),
    //                   ),
    //                 ],
    //               ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
