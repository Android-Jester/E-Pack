import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';

class DateTimePicker extends StatelessWidget {
  final DateRangePickerController dateController = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.blue,
      )),
      width: Config.width! / 1.2,
      child: SfDateRangePicker(
        allowViewNavigation: true,
        backgroundColor: Colors.white,
        controller: dateController,
        minDate: DateTime.now(),
        onSelectionChanged: (val) {
          print(val.value);
        },
        navigationDirection: DateRangePickerNavigationDirection.vertical,
        initialDisplayDate: DateTime.now(),
        maxDate: DateTime(2021, 12, 15),
      ),
    );
  }
}
