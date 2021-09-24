import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  static String id = "Page1";
  const Page1({Key? key}) : super(key: key);
  Config config = new Config();
  @override
  Widget build(BuildContext context) {
    config.init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: MaterialStateColor.resolveWith((states) => Colors.white),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                ),
              ),
            ),
            child: const Text("Book Now"),
            onPressed: () => Navigator.pushNamed(context, Page2.id),
          ),
        ],
      ),
    );
  }
}
