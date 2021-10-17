import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page3.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/selection_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String id = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    Config.init(context);
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
                    height: itemHeight(10.0),
                  ),
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "WELCOME TO E-PACK SERVICES",
                          style:
                              TextStyle(fontSize: 17.0, color: Colors.black)),
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectionButton(
                      text1: "ROOM PACKING SERVICE WITH STORAGE",
                      text2:
                          "we pick the very best location to store your very items",
                      text3: "all at an affordable pricing",
                      onPressed: () {
                        Navigator.of(context).pushNamed(TandC.id);
                      },
                    ),
                    SelectionButton(
                      text1: "ROOM PACKING SERVICE WITH STORAGE",
                      text2:
                          "we pick the very best location to store your very items",
                      text3: "all at an affordable pricing",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(
                vertical: itemHeight(10.0),
                horizontal: itemWidth(10.0),
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
                  color: Color(0xFF5f7f35),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            )),
          ],
        ),
      ),
    );
  }
}
