import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/log_in/presentation/pages/log_in.dart';
import 'package:e_pack/features/sign_up/presentation/provider/login_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  static String id = "signUp";
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late FocusNode userNameNode;
  late FocusNode emailNode;
  late FocusNode passwordNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameNode = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    userNameNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Consumer<SignupInfo>(builder: (context, data, widget) {
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
                      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(vertical: itemHeight(8.0), horizontal: itemWidth(8.0)),
                              child: Text("LOGIN"),
                            ),
                            onTap: () => Navigator.popAndPushNamed(context, LogIn.id),
                          ),
                          Text(
                            "sign Up".toUpperCase(),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(25.0), color: Colors.white),
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
                        height: 10.0,
                      ),
                      TextWithLabel(
                          node: userNameNode,
                          nextNode: emailNode,
                          text: "Name",
                          type: TextInputType.name,
                          validate: (val) => data.userNameValidator(val),
                          textCon: data.userNamecontroller),
                      TextWithLabel(
                          node: emailNode,
                          nextNode: passwordNode,
                          text: "Email",
                          type: TextInputType.emailAddress,
                          validate: (val) => data.emailvalidator(val),
                          textCon: data.emailcontroller),
                      TextWithLabel(
                        node: passwordNode,
                        text: "Password",
                        validate: null,
                        textCon: data.passwordcontroller,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: itemWidth(15)),
                        child: FlutterPwValidator(
                          successColor: Colors.green,
                          failureColor: Colors.red,
                          controller: data.passwordcontroller,
                          minLength: 6,
                          uppercaseCharCount: 2,
                          numericCharCount: 3,
                          specialCharCount: 1,
                          width: 400,
                          height: 150,
                          onSuccess: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: itemHeight(30.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(20), vertical: itemHeight(20)),
                child: CustomButton(text: "Sign Up", onPressed: () async {}),
              ),
            ],
          );
        }),
      ),
    );
  }
}
