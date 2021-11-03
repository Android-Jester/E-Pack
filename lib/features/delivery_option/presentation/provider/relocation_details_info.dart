import 'package:flutter/material.dart';

class RelocationDetailsInfo extends ChangeNotifier {
  int _relocationValue = 0;

  int get relocationValue => _relocationValue;

  setRelocationValue(int input) {
    _relocationValue = input;
    notifyListeners();
  }
}
