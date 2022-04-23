import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import '../../../../features/storage_option/presentation/provider/bloc/storage_cubit.dart';
import '../configurations/sizes.dart';
import '../screen/terms_and_conditions.dart';
import 'options/check_box.dart';

class CheckBoxesAgreements extends StatefulWidget {
  final Cubit cubit;
  CheckBoxesAgreements({
    required this.cubit,
    Key? key}) : super(key: key);

  @override
  State<CheckBoxesAgreements> createState() => _CheckBoxesAgreementsState();
}

class _CheckBoxesAgreementsState extends State<CheckBoxesAgreements> {
  bool isAgreed = false;
  bool isGranted = false;

  List<String> options = [
    "Granting Access to Storage",
    "Agreement to Terms and Conditions"
  ];

  void cubitChecker(Cubit cubit) {
    if(cubit is StorageCubit) {
      cubit.isAgreed = isAgreed;
      cubit.isGranted = isGranted;
    } else if(cubit is DeliveryCubit) {
      cubit.isAgreed = isAgreed;
      cubit.isGranted = isGranted;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemHeight(5)),
      child: Column(
          children: [
            CheckBoxRow(
              textInput: options[0],
              checkValue: isAgreed,
              function: (val) => setState(() {
                isAgreed = val!;
                cubitChecker(widget.cubit);
              }),
            ),
            CheckBoxRow(
              text: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TermsAndConditions()));
                },
                child: Text(
                  options[1],
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 15.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              checkValue: isGranted,
              function: (val) => setState(() {
                isGranted = val!;
                cubitChecker(widget.cubit);
              }),
            )
          ]
      ),
    );
  }
}