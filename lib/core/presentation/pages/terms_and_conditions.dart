import 'package:e_pack/core/presentation/provider/home_screen_data.dart';
import 'package:e_pack/features/delivery_option/presentation/delivery_option.dart';
import 'package:e_pack/features/storage_option/presentation/storage_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';
import '../widgets/custom_button.dart';

class TandC extends StatelessWidget {
  static String id = "TandC";
  int price1 = 2;
  int price2 = 3;
  TandC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isDelivery =
        Provider.of<HomeScreenData>(context, listen: false).delivery;
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
                  height: itemHeight(200),
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
            height: itemHeight(200.0),
            width: double.infinity,
          ),
          SizedBox(
            height: itemHeight(50.0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(17.0)),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                      text: " Terms and conditions \n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: itemWidth(35.0),
                        decoration: TextDecoration.underline,
                      )),
                  TextSpan(
                      text:
                          " We pack all your belongings in your own room for you and then store your items for you until you need them redelivered \n ",
                      style: TextStyle(
                          color: Colors.black, fontSize: itemWidth(17.0))),
                  TextSpan(
                    text: "\n\nAdditional Items\n",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: itemWidth(35.0),
                    ),
                  ),
                  TextSpan(
                      text:
                          "Storage of your items until you need them redelivered: \$$price1 a week \n\n",
                      style: TextStyle(fontSize: itemWidth(17.0))),
                  TextSpan(
                      text:
                          "Storage redelivery to a different address: \$$price2")
                ],
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
              text: "Book Now",
              onPressed: () {
                (!isDelivery!)
                    ? Navigator.pushNamed(context, DeliveryOption.id)
                    : Navigator.pushNamed(context, StorageOption.id);
              }),
          const Spacer(),
        ],
      ),
    );
  }
}
