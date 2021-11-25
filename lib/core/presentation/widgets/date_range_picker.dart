import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimePicker extends StatelessWidget {
  final DateRangePickerController dateController;
  final void Function(DateRangePickerSelectionChangedArgs val) onSelectionChanged;
  final DateTime? initDate;
  final DateTime? endDate;
  final Color color;
  DateTimePicker({
    Key? key,
    required this.dateController,
    required this.onSelectionChanged,
    required this.color,
    this.initDate,
    this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(itemWidth(25.0)),
      ),
      width: Config.width!,
      padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
      child: SfDateRangePicker(
          allowViewNavigation: true,
          backgroundColor: color,
          controller: dateController,
          minDate: DateTime.now(),
          onSelectionChanged: onSelectionChanged,
          navigationDirection: DateRangePickerNavigationDirection.vertical,
          initialDisplayDate: initDate,
          maxDate: endDate),
    );
  }
}
