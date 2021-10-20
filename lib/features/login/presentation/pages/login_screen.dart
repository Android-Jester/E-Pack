import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email, password;
  void sendRequest({required String email, required String password}) {
    AppWriteServer server = AppWriteServer();
    Account acc = Account(server.initClient());
    acc
        .create(email: email, password: password)
        .then((value) => print("Response: ${value}"))
        .catchError((err) {
      print("Error: ${err}");
    });
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    TextEditingController? emailController = TextEditingController(text: " ");
    TextEditingController? passwordController =
        TextEditingController(text: " ");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            textWithLabel(
                text: "email",
                onChanged: (val) {
                  email = val;
                }),
            SizedBox(
              height: itemHeight(10.0),
            ),
            textWithLabel(
                text: "password",
                onChanged: (val) {
                  password = val;
                }),
            TextButton(
              onPressed: () {
                print("Button Clicked");
                sendRequest(email: email, password: password);
              },
              child: Text("Attempt"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget textWithLabel(
      {required String? text,
      required void Function(String value) onChanged,
      TextInputType? type = TextInputType.text}) {
    return Container(
      padding: EdgeInsets.only(top: itemHeight(5.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text!),
          SizedBox(
            height: itemHeight(2.5),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
              child: TextField(
                  onChanged: onChanged,
                  keyboardType: type,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()))),
        ],
      ),
    );
  }
}
