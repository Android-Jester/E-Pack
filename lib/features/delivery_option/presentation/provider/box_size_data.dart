import 'package:flutter/material.dart';

class BoxSizeData extends ChangeNotifier {
  final TextEditingController? largeBoxController =
      TextEditingController(text: "0");
  final TextEditingController? mediumBoxController =
      TextEditingController(text: "0");
  final TextEditingController? smallBoxController =
      TextEditingController(text: "0");

  int get largeBoxSizeText => int.parse(largeBoxController!.text);

  int get mediumBoxSizeText => int.parse(mediumBoxController!.text);

  int get smallBoxSizeText => int.parse(smallBoxController!.text);

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  TextEditingController get large {
    setLargeBoxSize(largeBoxController!.text);
    return largeBoxController!;
  }

  setLargeBoxSize(String input) {
    largeBoxController!.text = input;
    print(largeBoxController!.text);
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

  bool isValid() => _formKey.currentState!.validate();
}
