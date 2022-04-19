import 'package:e_pack_final/core/core_usage/presentation/widgets/container_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../injector.dart';
import '../configurations/sizes.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}



class _TermsAndConditionsState extends State<TermsAndConditions> {

  @override
  void initState() {
    super.initState();
    fetchDataFromFile();
  }

  String tData = '';
  fetchDataFromFile() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/texts/terms_and_conditions.txt');
    setState(() {
      tData = responseText;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/Rectangle_1.png",
              width: Config.width!,
              fit: BoxFit.scaleDown,
            ),
            ContainerWrapper(
              padding: EdgeInsets.all(itemWidth(5)),
            child: Text(tData)
            )
          ],
        ),
      ),
    );
  }

}


