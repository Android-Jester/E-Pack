// import 'package:e_pack/core/presentation/config/colors.dart';
// import 'package:e_pack/core/presentation/config/config.dart';
// import 'package:e_pack/core/presentation/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatelessWidget {
//   static String id = "splash";
//   const SplashScreen({Key? key}) : super(key: key);
//
//   Widget buttonColumn(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: itemWidth(5.0)),
//       width: Config.width,
//       child: Column(
//         children: [
//           CustomButton(
//               text: "Login",
//               onPressed: () => Navigator.pushNamed(context, LogIn.id)),
//           CustomButton(
//               text: "Login",
//               onPressed: () => Navigator.pushNamed(context, SignUp.id)),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Config.init(context);
//     return Scaffold(
//       backgroundColor: kPrimaryColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Spacer(),
//           Image.asset(
//             "assets/images/Rectangle_1.png",
//             width: Config.width! / 6,
//             fit: BoxFit.scaleDown,
//           ),
//           buttonColumn(context),
//         ],
//       ),
//     );
//   }
// }
