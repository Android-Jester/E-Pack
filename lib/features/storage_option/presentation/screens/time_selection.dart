import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/features/storage_option/presentation/pages/storage_option/components/body.dart';
import 'package:e_pack/features/storage_option/presentation/widgets/datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TimeSelection extends StatefulWidget {
  final PageController? controller;
  final Body body;
  late TextEditingController _timeTickerController;
  TimeSelection({this.controller, required this.body});

  void onDateChange(String val) {
    _timeTickerController = TextEditingController(
        text: " Time to pick up materials is $val in $semesterPeriod");
  }

  String? semesterPeriod;
  String? dateTime;
  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  final DateRangePickerController? dateController = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    widget.semesterPeriod = "First Semester";
    Config.init(context);
    return Container(
      child: Column(
        children: [
          Spacer(),
          const Text(
            "Pick A Slot",
            style: TextStyle(fontSize: 30.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          DateTimePicker(
            selection: TimeSelection(
              body: widget.body,
            ),
          ),
          SizedBox(height: itemHeight(15.0)),
          Container(
            child: DropdownButton(
                value: widget.semesterPeriod,
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
                onChanged: (value) {
                  setState(
                      () => widget.body.setSemesterPeriod(value.toString()));
                }),
          ),
          SizedBox(
            height: itemHeight(40.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
              child: TextField(
                controller: widget._timeTickerController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "Please selecr a date to view Timeslot here",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(itemWidth(12.0)),
                    )),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
