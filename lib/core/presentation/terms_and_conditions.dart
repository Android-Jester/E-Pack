import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option.dart';
import 'package:e_pack/features/storage_option/presentation/pages/storage_option/storage_option.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';
import 'home_screen.dart';
import 'widgets/custom_button.dart';

class TandC extends StatelessWidget {
  static String id = "TandC";
  int price1 = 2;
  int price2 = 3;
  TandC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/box.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: itemHeight(150.0),
                ),
                Positioned(
                  top: itemHeight(15.0),
                  left: itemWidth(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: itemWidth(30.0),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new)),
                  ),
                ),
              ],
            ),
            height: itemHeight(150.0),
            width: double.infinity,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(15.0)),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  const TextSpan(
                      text: " Terms and conditions \n\n ",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      )),
                  const TextSpan(
                      text:
                          " We pack all your belongings in your own room for you and then store your items for you until you need them redelivered \n ",
                      style: TextStyle(color: Colors.black)),
                  const TextSpan(
                    text: "\n\nAdditional Items \n\n",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                      text:
                          "Storage of your items until you need them redelivered: \$ $price1 a week \n\n"),
                  TextSpan(
                      text:
                          "Storage redelivery to a different address: \$$price2")
                ],
              ),
            ),
          ),
          Spacer(),
          CustomButton(
              text: "Book Now",
              onPressed: () => {
                    (HomeScreen.isDelivery!)
                        ? Navigator.pushNamed(context, DeliveryOption.id)
                        : Navigator.pushNamed(context, StorageOption.id)
                  }),
          Spacer(),
        ],
      ),
    );
  }
}
