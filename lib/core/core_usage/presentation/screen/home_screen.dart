import 'package:e_pack_final/features/delivery_option/presentation/delivery_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../features/storage_option/presentation/storage_option.dart';
import '../configurations/sizes.dart';
import '../widgets/selection_button.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blueGrey.shade300));
    Config.init(context);
    return Scaffold(
      body: Column(
        children: [
          header(context),
          selecionArea(context),
          briefWidget(context),
        ],
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: itemWidth(16.7), color: Colors.blue.shade50)),
          ),
        ],
      ),
      height: Config.height! / 3.87,
      width: Config.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
    );
  }

  Expanded selecionArea(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: Config.height,
        width: Config.width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectionButton(
              text1: "ROOM PACKING SERVICE WITH STORAGE",
              // text2: "we pick the very best location to store your very items",
              onPressed: () =>
                  Navigator.of(context).popAndPushNamed(StorageOption.id),
            ),
            SelectionButton(
              text1: "ROOM PACKING SERVICE WITH DELIVERY",
              // text2: "We and our trusted drivers would help delivery your items back home.",
              onPressed: () =>
                  Navigator.of(context).popAndPushNamed(DeliveryOption.id),
            ),
          ],
        ),
      ),
    );
  }

  Expanded header(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: itemHeight(50.0),
              ),
              Image.asset("assets/images/Logo.png"),
              SizedBox(
                height: itemHeight(10.0),
              ),
              Text("WELCOME TO E-PACK SERVICES",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 25,
                      )),
            ],
          ),
          height: Config.height! / 2.5,
          width: Config.width,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade300,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
        ));
  }
}
