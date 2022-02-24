import 'package:e_pack/core/presentation/provider/home_screen_data.dart';
import 'package:e_pack/core/presentation/widgets/selection_button.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/delivery_option/delivery_option.dart';
import 'package:e_pack/features/storage_option/presentation/storage_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.blueGrey.shade300));
    Config.init(context);
    return Scaffold(
      body: Consumer<HomeScreenData>(
        builder: (context, data, child) => Column(
          children: [
            header(),
            selecionArea(context),
            briefWidget(context),
          ],
        ),
      ),
    );
  }

  Container briefWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: itemHeight(10.0),
        horizontal: itemWidth(15.0),
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
      height: Config.height! / 3.87,
      width: Config.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
    );
  }

  Expanded selecionArea(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: Config.height,
        width: Config.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectionButton(
              text1: "ROOM PACKING SERVICE WITH STORAGE",
              text2: "we pick the very best location to store your very items",
              // text3: "all at an affordable pricing",
              onPressed: () => Navigator.of(context).pushNamed(StorageOption.id),
            ),
            SelectionButton(
              text1: "ROOM PACKING SERVICE WITH DELIVERY",
              text2: "We and our trusted drivers would help delivery your items back home.",
              // text3: "all at an affordable pricing",
              onPressed: () => Navigator.of(context).pushNamed(DeliveryOption.id),
            ),
          ],
        ),
      ),
    );
  }

  Expanded header() {
    return Expanded(
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
        ));
  }
}
