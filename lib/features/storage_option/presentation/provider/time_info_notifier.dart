import 'package:flutter/material.dart';

class TimeInfo extends ChangeNotifier {
  TextEditingController? _timeDate;
  String _semesterPeriod = "First Semester";
  String? dateTimeVal;

  void onDateChange({String? val}) {
    dateTimeVal = val;
    _timeDate = TextEditingController(
        text: " Time to pick up materials is $dateTimeVal in $_semesterPeriod");
    notifyListeners();
  }

  get timeDateData => _timeDate;
  get semesterPeriod => _semesterPeriod;

  void setSemesterPeriod(String input) {
    _semesterPeriod = input;
    print(_semesterPeriod);
    onDateChange(val: dateTimeVal);
    notifyListeners();
  }

  validation() {
    if (_timeDate!.text.isEmpty && _semesterPeriod.isEmpty) {
      return "Please enter the date and time";
    }
  }
}
