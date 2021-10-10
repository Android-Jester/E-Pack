import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page1/page_1.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page_2.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
          Container(
            child: Stack(
              children: [
                Image.asset("assets/images/box.jpg"),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(8.0)),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
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
          CustomButton(text: "Book Now", onPressed: () => Navigator.pushNamed(context, Page1.id)),
        Spacer(),
        ],
      ),
    );
  }
}
