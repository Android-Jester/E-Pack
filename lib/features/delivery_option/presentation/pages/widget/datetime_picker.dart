import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/time_selection.dart'
    as delivery;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimePicker extends StatelessWidget {
  final DateRangePickerController dateController = DateRangePickerController();
  final delivery.TimeSelection selection;

  DateTimePicker({required this.selection});
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
          selection.onDateChange(val.value.toString());
        },
        navigationDirection: DateRangePickerNavigationDirection.vertical,
        initialDisplayDate: DateTime.now(),
        maxDate: DateTime(2021, 12, 15),
      ),
    );
  }
}
