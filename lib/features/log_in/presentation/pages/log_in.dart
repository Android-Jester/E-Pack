import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/log_in/data/datasources/auth_server.dart';
import 'package:e_pack/features/log_in/data/repositories/authentication_repo_impl.dart';
import 'package:e_pack/features/log_in/domain/usecases/auth_user.dart';
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

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late FocusNode emailNode;
  late FocusNode passwordNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

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
                    TextWithLabel(
                        node: emailNode,
                        nextNode: passwordNode,
                        text: "Email",
                        validate: (val) => data.emailvalidator(val),
                        textCon: data.emailcontroller),
                    TextWithLabel(
                      node: passwordNode,
                      text: "Password",
                      validate: (val) {
                        return null;
                      },
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
            CustomButton(
                text: "LogIn",
                onPressed: () async {
                  var usecase = AuthenticatingUser(
                      repo: AuthRepoImpl(authServer: AuthServerImpl()));
                  showDialog(
                      context: context,
                      builder: (con) {
                        return SimpleDialog(
                          children: [
                            Text("Ready to start"),
                            Row(
                              children: [
                                CustomButton(
                                    text: "Yes",
                                    onPressed: () async {
                                      print("action");
                                      var parms = Params(
                                          email: data.emailcontroller.text,
                                          password:
                                              data.passwordcontroller.text);
                                      print(parms);
                                      await usecase(Params(
                                          email: data.email,
                                          password: data.password));
                                      // Navigator.pushNamed(
                                      //     context, HomeScreen.id, arguments: );
                                    }),
                                CustomButton(
                                    text: "No",
                                    onPressed: () => Navigator.pop(con)),
                              ],
                            ),
                          ],
                        );
                      });
                }),
          ],
        );
      }),
    );
  }
}
