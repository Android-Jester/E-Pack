import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/header_container.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/sign_up/presentation/provider/SignUp_info.dart';
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
              ContainerHeader(),
              SizedBox(height: itemHeight(30.0)),
              ContainerWrapper(
                padding: EdgeInsets.symmetric(vertical: itemHeight(15)),
                child: Form(
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
                            failureColor: Theme.of(context).colorScheme.error,
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
