import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page_1.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String id = "HomeScreen";
  Config config = Config();
  @override
  Widget build(BuildContext context) {
    config.init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //   title: const Text("E-Pack"),
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.arrow_back_ios),
      //   //   onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())),
      //   // ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Image.asset("assets/images/Rectangle_1.png"),
                  SizedBox(
                    height: config.itemHeight(10.0),
                  ),
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "WELCOME TO E-PACK SERVICES",
                          style: TextStyle(fontSize: 17.0, color: Colors.black)),
                    ]),
                  )
                ],
              ),
              height: Config.height! / 2,
              width: Config.width,
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )),
            )),
            Expanded(
              flex: 2,
              child: Container(
                height: Config.height,
                width: Config.width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectionButton(
                      config: config,
                      text1: "ROOM PACKING SERVICE WITH STORAGE",
                      text2: "we pick the very best location to store your very items",
                      text3: "all at an affordable pricing",
                      onPressed: () {
                        Navigator.of(context).pushNamed(Page1.id);
                      },
                    ),
                    selectionButton(
                      config: config,
                      text1: "ROOM PACKING SERVICE WITH STORAGE",
                      text2: "we pick the very best location to store your very items",
                      text3: "all at an affordable pricing",
                      onPressed: () {
                        Future result = Database(AppWriteServer().userClient())
                            .createDocument(collectionId: "60f4529c27565", data: {
                          "firstName": "Kwadwo",
                          "lastName": "Duah",
                          "emailAddress": "duah12@outlook.com",
                          "phoneNumber": "0201317498",
                          "largeBoxSizeCount": 5,
                          "mediumBoxSizeCount": 2,
                          "smallBoxSizeCount": 1,
                          "locationName": "Ayduase",
                          "apartmentName": "Whitpam A Hostel",
                          "roomNumber": 213,
                          "address": "Ayduase Gate",
                          "cost": 2550.0
                        });
                        result.then((value) => print(value));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(
                vertical: config.itemHeight(10.0),
                horizontal: config.itemWidth(10.0),
              ),
              child: Column(
                children: [
                  const Text(
                    "Brief\n ",
                    style: TextStyle(
                      fontSize: 20.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(children: [
                      TextSpan(
                        text:
                            "On any chance you left your items at the hostel but need assistance to pack all your assets in your room please selected your preferable Room Packing Service Our expert movement group can visit your room with authorization and pack the whole items in your room, store it however long you want and redeliver to another confined hostel address",
                      ),
                    ]),
                  ),
                ],
              ),
              height: Config.height! / 2,
              width: Config.width,
              decoration: const BoxDecoration(
                  color: Color(0xFF5f7f35), borderRadius: BorderRadius.all(Radius.circular(20.0))),
            )),
          ],
        ),
      ),
    );
  }
}

class selectionButton extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final onPressed;
  const selectionButton({
    Key? key,
    required this.config,
    this.text1,
    this.text2,
    this.text3,
    required this.onPressed,
  }) : super(key: key);

  final Config config;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(config.itemHeight(10.0)),
      child: OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(config.itemWidth(20.0)))))),
        onPressed: onPressed,
        child: Container(
          width: Config.width,
          padding: EdgeInsets.symmetric(horizontal: config.itemWidth(30.0)),
          child: Column(
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(text: "$text1 \n"),
                    TextSpan(text: "$text2 \n"),
                    TextSpan(text: " $text3 \n"),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
