import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final void Function() retry;
  final void Function() dispose;

  const ErrorDialog({
    Key? key,
    required this.retry,
    required this.dispose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemWidth(30.0))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: itemHeight(20.0)),
        width: itemWidth(150),
        height: itemHeight(260),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: itemWidth(40),
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: itemWidth(60.0),
                ),
              ),
              Text(
                "Error Please Try Again",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(25)),
              ),
              SizedBox(
                height: 12,
              ),
              CustomButton(
                width: itemWidth(250),
                text: "Retry",
                onPressed: retry,
              ),
              SizedBox(height: itemHeight(5.0)),
              CustomButton(
                width: itemWidth(250),
                text: "Cancel",
                onPressed: dispose,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
