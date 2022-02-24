import 'package:flutter/material.dart';

class StorageRoomTypeData extends ChangeNotifier {
  int _roomType = 0;

  void setRoomType(int input) {
    _roomType = input;
    notifyListeners();
  }

  String get roomTypeSelected => _roomType.toString();
  int get roomType => _roomType;
}
