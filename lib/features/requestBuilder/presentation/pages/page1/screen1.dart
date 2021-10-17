import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Screen1 extends StatefulWidget {
  final PageController? controller;
  final DateRangePickerController? dateController;
  const Screen1(
      {Key? key, required this.controller, required this.dateController})
      : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String semesterPeriod = "First Semester";
  final TextEditingController _timeTickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          DateTimePicker(widget: widget),
          SizedBox(height: itemHeight(15.0)),
          Container(
            child: DropdownButton(
                value: semesterPeriod,
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
                  setState(() {
                    semesterPeriod = value.toString();
                  });
                }),
          ),
          SizedBox(
            height: itemHeight(40.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
              child: TextField(
                controller: _timeTickerController,
                onChanged: (val) {
                  _timeTickerController.text =
                      "The Date of Collection is ${widget.dateController!.displayDate} at ${DateTime.now().hour} : ${DateTime.now().minute}";
                },
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
