import 'package:flutter/material.dart';

class RoomTypeData extends ChangeNotifier {
  int _roomType = 0;

  void setRoomType(int input) {
    _roomType = input;
    notifyListeners();
  }

  get roomType => _roomType;
}
