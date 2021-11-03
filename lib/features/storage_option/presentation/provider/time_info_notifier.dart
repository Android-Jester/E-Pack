import 'package:flutter/material.dart';

class TimeInfo extends ChangeNotifier {
  TextEditingController? _timeDate;
  String _semesterPeriod = "First Semester";

  void onDateChange({String? val}) {
    String semPeriod = _semesterPeriod;

    _timeDate = TextEditingController(
        text: " Time to pick up materials is $val in $semPeriod");
    notifyListeners();
  }

  get timeDateData => _timeDate;
  get semesterPeriod => _semesterPeriod;

  void setSemesterPeriod(String input) {
    _semesterPeriod = input;
    print(_semesterPeriod);
    notifyListeners();
  }

  validation() {
    if (_timeDate!.text.isEmpty && _semesterPeriod.isEmpty) {
      return "Please enter the date and time";
    }
  }
}
