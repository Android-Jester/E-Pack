import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Screen1 extends StatefulWidget {
  final PageController? controller;
  const Screen1({Key? key, required this.controller}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String semesterPeriod = "First Semester";

  @override
  Widget build(BuildContext context) {
    Config config = Config();
    config.init(context);
    return Container(
      width: Config.width,
      height: Config.height,
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "Pick A Slot",
            style: TextStyle(fontSize: 30.0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.blue,
            )),
            width: Config.width! / 1.2,
            child: SfDateRangePicker(),
          ),
          SizedBox(height: config.itemHeight(15.0)),
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

            // TextField(
            //   readOnly: true,
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(config.itemWidth(12.0)),
            //   )),
            // ),
          ),
          SizedBox(height: config.itemHeight(15.0)),
          //TODO: TimeStamp(Display the information on the number of days apart)
        ],
      ),
    );
  }
}
