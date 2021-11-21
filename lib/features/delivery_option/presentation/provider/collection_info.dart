import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class CollectionInfo extends ChangeNotifier {
  TextEditingController residenceNameController = TextEditingController();
  TextEditingController roomNumController = TextEditingController();
  TextEditingController mobileNumController =
      MaskedTextController(mask: '(000) 000-0000');
  TextEditingController accessNoteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isGranted = false;
  bool _isAgreed = false;
  String addressType = "Hostel";

  get key => _formKey;
  String get residenceName => residenceNameController.text;
  String get roomNumber => roomNumController.text;
  String get mobileNumber => mobileNumController.text;
  String get accessNote => accessNoteController.text;

  get isGranted => _isGranted;
  get isAgreed => _isAgreed;

  bool get validated => _formKey.currentState!.validate();

  setAgree(bool input) {
    if (validated) {
      _isAgreed = input;
      print("Agreed: $_isAgreed");
      notifyListeners();
    }
  }

  setGranted(bool input) {
    if (validated) {
      _isGranted = input;
      print("Granted: $_isGranted");
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
