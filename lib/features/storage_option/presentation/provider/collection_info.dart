import 'package:flutter/material.dart';

class CollectionInfo extends ChangeNotifier {
  TextEditingController residenceNameController = TextEditingController();
  TextEditingController roomNumController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController addressTypeController = TextEditingController();
  TextEditingController accessNoteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isGranted = false;
  bool _isAgreed = false;

  get key => _formKey;

  get isGranted => _isGranted;
  get isAgreed => _isAgreed;

  bool get validated => _formKey.currentState!.validate();

  setAgree(bool input) {
    if (validated) {
      _isAgreed = input;
      notifyListeners();
    }
  }

  setGranted(bool input) {
    if (validated) {
      _isGranted = input;
      notifyListeners();
    }
  }

  String? validator(String val,
      {bool isNumeric = false, bool isPhoneNumber = false}) {
    if (val.isEmpty) {
      return "Please Fill this space";
    }
    if (isNumeric) {
      if (int.parse(val) is num) {
        if (isPhoneNumber) {
          return (val.length > 10) ? "Please type 10 digits" : null;
        }
        return null;
      } else {
        return "Please type in a number and not a text";
      }
    }
    return null;
  }

  void nextButton() {
    residenceNameController.dispose();
    roomNumController.dispose();
    mobileNumController.dispose();
    addressTypeController.dispose();
    accessNoteController.dispose();
    notifyListeners();
  }
}
