import 'package:flutter/material.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/configurations/theme.dart';
import '../provider/bloc/delivery_cubit.dart';

class DropDownObjects extends StatelessWidget {
  final DeliveryCubit cubit;
  DropDownObjects({
    required this.cubit,
    Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: itemHeight(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address Type",
            style: TextStyle(fontSize: itemWidth(15.0)),
          ),
          SizedBox(height: itemHeight(2.5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(30.0)),
            child: DropdownButtonFormField(
              decoration: inputDecoration(context),
              value: cubit.addressType,
              items: List.generate(cubit.addressValue.length, (i) => DropdownMenuItem(
                child: Text(cubit.addressValue[i]),
                value: cubit.addressValue[i],
              )),
              onChanged: (value) {
                cubit.addressType = value.toString();
              },
            ),
          ),
        ],
      ),
    );
  }
}