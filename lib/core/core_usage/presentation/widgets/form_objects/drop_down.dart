import 'package:flutter/material.dart';

import '../../../../../features/storage_option/presentation/provider/bloc/storage_cubit.dart';
import '../../configurations/sizes.dart';
import '../../configurations/theme.dart';

class DropDownObjects extends StatelessWidget {
  final StorageCubit cubit;
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