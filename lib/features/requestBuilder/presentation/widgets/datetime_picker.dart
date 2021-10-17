import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page1/screen1.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Screen1 widget;

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
        onViewChanged: (val) {
          print(val);
        },
        backgroundColor: Colors.white,
        controller: widget.dateController,
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
