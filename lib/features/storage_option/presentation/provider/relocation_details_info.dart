import 'package:flutter/material.dart';

class StorageWeeksData extends ChangeNotifier {
  int _storageWeeks = 0;

  int get weeks => _storageWeeks;

  setWeeks(int input) {
    _storageWeeks = input;
    notifyListeners();
  }
}
