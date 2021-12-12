import 'package:e_pack/core/presentation/widgets/page_button.dart';
import 'package:e_pack/features/delivery_option/presentation/components/body.dart';
import 'package:flutter/material.dart';

class TimeInfo extends ChangeNotifier {
  TextEditingController? _timeDate;
  String? dateTimeVal;

  void onDateChange(DateTime val) {
    dateTimeVal = val.toString();
    _timeDate = TextEditingController(text: "Time to pick up materials is ${dateTimeVal!.substring(0, 16)}");
    notifyListeners();
  }

  get timeDateData => _timeDate;

  validation(PageController controller, ScrollController scroll, int currentPage) {
    if (_timeDate!.text.isEmpty) {
      if (timeDateData != null) {
        smoothScrollToTop(scroll);
        direction(controller, currentPage, true);
      }
      return "Please enter the Date";
    }
  }
}
