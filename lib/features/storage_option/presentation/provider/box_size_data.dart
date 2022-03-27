import 'package:flutter/material.dart';

class StorageBoxSizeData extends ChangeNotifier {
  final TextEditingController? largeBoxController =
      TextEditingController(text: "0");
  final TextEditingController? mediumBoxController =
      TextEditingController(text: "0");
  final TextEditingController? smallBoxController =
      TextEditingController(text: "0");

  int get largeBoxSizeText => int.parse(largeBoxController!.text);
  int get mediumBoxSizeText => int.parse(mediumBoxController!.text);
  int get smallBoxSizeText => int.parse(smallBoxController!.text);

  setLargeBoxSize(String input) {
    largeBoxController!.text = input;
    notifyListeners();
  }

  setMediumBoxSize(String input) {
    largeBoxController!.text = input;
    notifyListeners();
  }

  setSmallBoxSize(String input) {
    largeBoxController!.text = input;
    notifyListeners();
  }
}
