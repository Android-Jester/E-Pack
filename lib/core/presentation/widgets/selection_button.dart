import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String text1;
  final String text2;
  // final String? text3;
  final void Function() onPressed;
  const SelectionButton({
    Key? key,
    required this.text1,
    required this.text2,
    // this.text3,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemHeight(10.0)),
      child: OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(itemWidth(20.0)))))),
        onPressed: onPressed,
        child: Container(
          width: Config.width,
          // padding: EdgeInsets.symmetric(horizontal: itemWidth(5.0)),
          child: Column(
            children: [
              SizedBox(height: itemHeight(15)),
              Text(
                text1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: itemWidth(17)),
              ),
              SizedBox(height: itemHeight(10)),
              Text(
                text2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(14)),
              ),
              SizedBox(height: itemHeight(15)),
            ],
          ),
        ),
      ),
    );
  }
}
