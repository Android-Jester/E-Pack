import 'package:flutter/material.dart';

class CollectionInfo extends ChangeNotifier {
  TextEditingController residenceNameController = TextEditingController();
  TextEditingController roomNumController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController accessNoteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isGranted = false;
  bool _isAgreed = false;
  String addressType = "Hostel";

  String get residenceName => residenceNameController.text;
  String get roomNumber => roomNumController.text;
  String get mobileNumber => mobileNumController.text;
  String get accessNote => accessNoteController.text;
  get key => _formKey;

  get isGranted => _isGranted;
  get isAgreed => _isAgreed;

  bool get validated => _formKey.currentState!.validate();

  setAgree(bool input) {
    if (_formKey.currentState!.validate()) {
      _isAgreed = input;
      notifyListeners();
    }
  }

  setGranted(bool input) {
    if (_formKey.currentState!.validate()) {
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
      if (isPhoneNumber) {
        return (val.length > 10 && val.length < 10)
            ? "Please type 10 digits"
            : null;
      }
    } else {
      return null;
    }
    return null;
  }
}
