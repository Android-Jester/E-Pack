import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../configurations/sizes.dart';

class DateTimePicker extends StatelessWidget {
  final DateRangePickerController dateController;
  final void Function(DateRangePickerSelectionChangedArgs val) onSelectionChanged;
  final DateTime? endDate;
  DateTimePicker({
    Key? key,
    required this.dateController,
    required this.onSelectionChanged,
    this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(itemWidth(25.0)),
      ),
      width: Config.width!,
      padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
      child: SfDateRangePicker(allowViewNavigation: true, controller: dateController, minDate: DateTime.now(), onSelectionChanged: onSelectionChanged, navigationDirection: DateRangePickerNavigationDirection.horizontal, initialDisplayDate: DateTime.now(), maxDate: endDate),
    );
  }
}
