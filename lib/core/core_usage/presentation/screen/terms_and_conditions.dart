import 'package:e_pack_final/core/core_usage/presentation/widgets/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configurations/sizes.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}



class _TermsAndConditionsState extends State<TermsAndConditions> {
  String text = "";


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/Rectangle_1.png",
          width: Config.width!,
          fit: BoxFit.scaleDown,
        ),
        ContainerWrapper(
        child: Text(text)
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}


