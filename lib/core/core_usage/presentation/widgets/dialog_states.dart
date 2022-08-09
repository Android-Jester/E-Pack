import 'package:flutter/material.dart';

import '../configurations/sizes.dart';
import 'custom_button.dart';

class ErrorDialog extends StatelessWidget {
  final void Function() retry;
  final void Function() dispose;

  const ErrorDialog({
    Key? key,
    required this.retry,
    required this.dispose,
  }) : super(key: key);

  builder(context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(context: context, builder: (context) => build(context));
    });
  }

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
                backgroundColor: Theme.of(context).colorScheme.error,
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
              const SizedBox(
                height: 12,
              ),
              CustomButton(
                color: Theme.of(context).colorScheme.primaryVariant,
                width: itemWidth(250),
                text: "Retry",
                onPressed: retry,
              ),
              SizedBox(height: itemHeight(5.0)),
              CustomButton(
                width: itemWidth(250),
                text: "Cancel",
                onPressed: dispose,
                color: Theme.of(context).colorScheme.secondaryVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
  }) : super(key: key);

  builder(context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(context: context, builder: (context) => build(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(itemWidth(15)),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String text;
  final String routeid;
  const SuccessDialog({
    required this.text,
    required this.routeid,
    Key? key,
  }) : super(key: key);

  builder(context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(context: context, builder: (context) => build(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemWidth(30.0))),
      child: Container(
        height: itemHeight(140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            SizedBox(height: itemHeight(20)),
            CustomButton(
              width: itemWidth(200),
              text: "Let's Go",
              onPressed: () => Navigator.popAndPushNamed(context, routeid),
            ),
          ],
        ),
      ),
    );
  }
}

class WarningDialog extends StatelessWidget {
  final String text;

  WarningDialog({required this.text});

  builder(context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(context: context, builder: (context) => build(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SizedBox(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemWidth(30.0))),
        child: Container(
          padding: EdgeInsets.all(itemWidth(20.0)),
          width: itemWidth(150),
          height: itemHeight(260),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: itemHeight(15),
                ),
                CircleAvatar(
                  radius: itemWidth(40),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: itemWidth(60.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: itemHeight(15)),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(25)),
                  ),
                ),
                SizedBox(
                  height: itemHeight(12),
                ),
                CustomButton(
                  width: itemWidth(250),
                  text: "Cancel",
                  onPressed: () => Navigator.pop(context),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
