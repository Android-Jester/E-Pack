import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/log_in/presentation/provider/login_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  static String id = "Login";
  LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SingleChildScrollView(
      child: Consumer<LoginInfo>(builder: (context, data, widget) {
        return Column(
          children: [
            Container(
              height: Config.height! / 2.5,
              color: Colors.grey,
              width: double.infinity,
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    "assets/images/Rectangle_1.png",
                  ),
                  Spacer(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Log In".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: itemWidth(25.0),
                                  color: Colors.white),
                        ),
                        Text(
                          "sign Up".toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: itemHeight(30.0)),
            Form(
              key: data.key,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 45.0,
                    ),
                    textRow("Email", data.emailcontroller,
                        (val) => data.emailvalidator(val)),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: itemHeight(20.0)),
                        child: textRow("Password", data.passwordcontroller)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: itemWidth(15)),
                      child: FlutterPwValidator(
                          controller: data.passwordcontroller,
                          minLength: 6,
                          uppercaseCharCount: 2,
                          numericCharCount: 3,
                          specialCharCount: 1,
                          width: 400,
                          height: 150,
                          onSuccess: () {}),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: itemHeight(30.0)),
            CustomButton(text: "LogIn", onPressed: () {}),
          ],
        );
      }),
    );
  }

  Widget textRow(String label, TextEditingController? controller,
      [String Function(String? val)? validate]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextFormField(
            controller: controller,
            validator: validate,
            decoration: InputDecoration(
                suffixIcon: Icon(
              Icons.check_circle_outline,
              size: 15.0,
              color: Colors.green,
            )),
          ),
        ],
      ),
    );
  }
}
