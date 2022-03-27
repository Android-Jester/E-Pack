import 'dart:io';

import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Finalize extends StatelessWidget {
  final String dateTimeVal;
  Finalize({required this.dateTimeVal});

  builder(context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(context: context, builder: (context) => build(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemWidth(30.0))),
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Container(
        height: itemHeight(350),
        width: itemWidth(240),
        child: Column(
          children: [
            SizedBox(height: itemHeight(15.0)),
            CircleAvatar(
                radius: itemWidth(40.0),
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.done,
                  size: itemWidth(50.0),
                  color: Colors.white,
                )),
            SizedBox(height: itemHeight(15.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: itemWidth(10.0)),
              child: Text(
                "Thank you for using E-Pack Services, we would complete your request at ${dateTimeVal}",
                softWrap: true,
              ),
            ),
            SizedBox(height: itemHeight(15.0)),
            CustomButton(
              width: itemWidth(260.0),
              text: 'Close',
              onPressed: () => exit(0),
            ),
            SizedBox(height: itemHeight(10.0)),
            CustomButton(
              width: itemWidth(260.0),
              text: 'Another Request',
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => Navigator.popAndPushNamed(context, HomeScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
