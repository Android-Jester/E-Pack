import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/date_range_picker.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/storage_option/presentation/components/body.dart';
import 'package:e_pack/features/storage_option/presentation/provider/time_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StorageTimeSelection extends StatefulWidget {
  final PageController? controller;
  late final int? currentPage;
  final ScrollController scroll;
  StorageTimeSelection({
    this.controller,
    this.currentPage,
    required this.scroll,
  });

  @override
  State<StorageTimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<StorageTimeSelection> with AutomaticKeepAliveClientMixin {
  DateRangePickerController? dateController = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<StorageTimeInfo>(builder: (context, data, child) {
      return SingleChildScrollView(
        child: ContainerWrapper(
          padding: EdgeInsets.symmetric(vertical: itemHeight(25.0)),
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
                color: Colors.white,
                dateController: dateController!,
                onSelectionChanged: (val) {
                  data.onDateChange(val: dateController!.selectedDate!.add(Duration(hours: (DateTime.now().hour + 5), minutes: 30)).toString());
                },
                initDate: DateTime.now(),
                endDate: DateTime(2022, 01, 15, 18, 00),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(60.0)),
                child: DropdownButtonFormField(
                  decoration: inputDecoration,
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
              SizedBox(height: itemHeight(15.0)),
              SizedBox(
                height: itemHeight(100.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
                  child: TextField(
                    controller: data.timeDateData,
                    readOnly: true,
                    showCursor: false,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Please select a date to view Timeslot here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(itemWidth(12.0)),
                        )),
                  ),
                ),
              ),
              PageButton(true, onPressed: () {
                smoothScrollToTop(widget.scroll);
                (data.timeDateData != null) ? direction(widget.controller!, widget.currentPage!, true) : null;
              }),
            ],
          ),
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
