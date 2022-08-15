import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../configurations/sizes.dart';

class DateTimePicker extends StatelessWidget {
  final DateRangePickerController dateController;
  final void Function(DateRangePickerSelectionChangedArgs val)
  onSelectionChanged;
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
          color: Theme
              .of(context)
              .backgroundColor
      ),
      width: Config.width!,
      padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
      child: SfDateRangePicker(
        allowViewNavigation: true,
        controller: dateController,
        minDate: DateTime.now(),
        cellBuilder: (context, cellDetails) {
          return Container(
            height: cellDetails.bounds.height,
            width: cellDetails.bounds.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                cellDetails.date.day.toString(),
                style: Theme.of(context).textTheme.bodyText2
              ),
            ),
          );
        },
        onSelectionChanged: onSelectionChanged,
        navigationDirection: DateRangePickerNavigationDirection.horizontal,
        initialDisplayDate: DateTime.now(),
        maxDate: endDate,
      ),
    );
  }


}