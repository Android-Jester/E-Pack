import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/date_range_picker.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/storage_option/presentation/provider/time_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TimeSelection extends StatefulWidget {
  final PageController? controller;
  late final int? currentPage;
  TextEditingController _timeTickerController = TextEditingController();

  TimeSelection({
    this.controller,
    this.currentPage,
  });

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  DateRangePickerController? dateController = DateRangePickerController();
  String? semesterPeriod;
  String? dateTime;
  void onDateChange(String val) {
    widget._timeTickerController = TextEditingController(
        text: " Time to pick up materials is $val in $semesterPeriod");
    print(widget._timeTickerController.text);
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<TimeInfo>(builder: (context, data, child) {
      return Container(
        child: Column(
          children: [
            const Text(
              "Pick A Slot",
              style: TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 5.0,
            ),
            DateTimePicker(
              dateController: dateController!,
              onSelectionChanged: (val) => data.onDateChange(val: val.value),
              initDate: DateTime.now(),
              endDate: DateTime(2022, 01, 15, DateTime.now().hour,
                  DateTime.now().minute, DateTime.now().second),
            ),
            SizedBox(height: itemHeight(15.0)),
            Container(
              child: DropdownButton(
                value: data.semesterPeriod,
                items: const [
                  DropdownMenuItem(
                    child: Text("First Semester"),
                    value: "First Semester",
                  ),
                  DropdownMenuItem(
                    child: Text("Second Semester"),
                    value: "Second Semester",
                  ),
                ],
                onChanged: (value) => data.setSemesterPeriod(value.toString()),
              ),
            ),
            SizedBox(
              height: itemHeight(60.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
                child: TextField(
                  controller: data.timeDateData,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "Please select a date to view Timeslot here",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(itemWidth(12.0)),
                      )),
                ),
              ),
            ),
            PageButton(
                isForward: true,
                pageCount: widget.currentPage!,
                controller: widget.controller,
                isDisabled: data.timeDateData == null),
          ],
        ),
      );
    });
  }
}
