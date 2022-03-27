import 'package:flutter/cupertino.dart';

class HomeScreenData extends ChangeNotifier {
  bool _isDelivery = false;

  get delivery => _isDelivery;

  setDelivery(bool input) => _isDelivery = input;
}
