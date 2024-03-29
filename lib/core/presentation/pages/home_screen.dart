import 'package:e_pack/core/presentation/config/colors.dart';
import 'package:e_pack/core/presentation/provider/home_screen_data.dart';
import 'package:e_pack/core/presentation/widgets/selection_button.dart';
import 'package:e_pack/features/delivery_option/presentation/delivery_option.dart';
import 'package:e_pack/features/storage_option/presentation/storage_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Consumer<HomeScreenData>(
        builder: (context, data, child) => Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: itemHeight(70.0),
                      ),
                      Image.asset("assets/images/Rectangle_1.png"),
                      SizedBox(
                        height: itemHeight(10.0),
                      ),
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(text: "WELCOME TO E-PACK SERVICES", style: TextStyle(fontSize: 17.0, color: Colors.black)),
                        ]),
                      )
                    ],
                  ),
                  height: Config.height! / 2.5,
                  width: Config.width,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade300,
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
                decoration: BoxDecoration(color: kBackgroundColor, borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectionButton(
                      text1: "ROOM PACKING SERVICE WITH STORAGE",
                      text2: "we pick the very best location to store your very items",
                      text3: "all at an affordable pricing",
                      onPressed: () {
                        // data.setDelivery(false);
                        Navigator.of(context).pushNamed(StorageOption.id);
                      },
                    ),
                    SelectionButton(
                      text1: "ROOM PACKING SERVICE WITH DELIVERY",
                      text2: "We and our trusted drivers would help delivery your items back home.",
                      text3: "all at an affordable pricing",
                      onPressed: () {
                        // data.setDelivery(true);
                        Navigator.of(context).pushNamed(DeliveryOption.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: itemHeight(10.0),
                horizontal: itemWidth(10.0),
              ),
              child: Column(
                children: [
                  Text(
                    "Brief",
                    style: TextStyle(
                      fontSize: itemWidth(25.0),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text:
                            "On any chance you left your items at the hostel but need assistance to pack all your assets in your room please selected your preferable Room Packing Service Our expert movement group can visit your room with authorization and pack the whole items in your room, store it however long you want and redeliver to another confined hostel address",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(16.7), color: Colors.blue.shade50)),
                  ),
                ],
              ),
              height: Config.height! / 4.2,
              width: Config.width,
              decoration: const BoxDecoration(
                  color: Color(0xFF5f7f35), borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
            ),
          ],
        ),
      ),
    );
  }
}
