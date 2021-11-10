import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static String id = "SignUp";
  SignUp({Key? key}) : super(key: key);

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
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            child: Column(
              children: [
                Spacer(),
                Image.asset(
                  "name",
                  width: 100,
                  height: 100,
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
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 45.0,
                ),
                textRow("Your Name"),
                textRow("Email"),
                textRow("Password"),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget textRow(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextFormField(
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
