import 'package:e_pack_final/core/core_usage/presentation/widgets/container_wrapper.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../configurations/sizes.dart';

class TermsAndConditions extends StatefulWidget {
  static String id = "terms";
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  late String data;
  @override
  void initState() async {
    super.initState();
    data = await rootBundle.loadString('assets/texts/terms_and_conditions.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/Logo.png",
              width: Config.width!,
              fit: BoxFit.scaleDown,
            ),
            ContainerWrapper(
                padding: EdgeInsets.all(itemWidth(5)),
                child: Text(
                  data,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            CustomButton(text: "Exit", onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }
}
