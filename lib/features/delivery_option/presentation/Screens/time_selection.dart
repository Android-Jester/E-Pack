import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/time_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TimeSelection extends StatefulWidget {
  final PageController? controller;
  late final int? currentPage;

  TimeSelection({
    this.controller,
    this.currentPage,
  });

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection>
    with AutomaticKeepAliveClientMixin {
  DateRangePickerController? dateController = DateRangePickerController();
  final _formKey = GlobalKey<FormState>();

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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(itemWidth(25.0)),
              ),
              width: Config.width!,
              padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
              child: SfDateRangePicker(
                allowViewNavigation: true,
                backgroundColor: kBackgroundColor,
                controller: dateController,
                minDate: DateTime.now(),
                onSelectionChanged: (val) {
                  data.onDateChange(val: val.value.toString());
                },
                navigationDirection:
                    DateRangePickerNavigationDirection.vertical,
                initialDisplayDate: DateTime.now(),
                maxDate: DateTime(2021, 12, 15),
              ),
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
                onChanged: (value) {
                  data.setSemesterPeriod(value.toString());
                },
              ),
            ),
            SizedBox(
              height: itemHeight(60.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
                child: TextFormField(
                  controller: data.timeDateData,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "Please selecr a date to view Timeslot here",
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
              isDisabled: (data.timeDateData == null) ? true : false,
            ),
          ],
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
