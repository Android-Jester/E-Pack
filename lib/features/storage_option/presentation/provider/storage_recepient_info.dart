import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:e_pack/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:flutter/material.dart';

import '../../../../injector.dart';

class StorageRecepientInfo extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController? _locationAddressController =
      TextEditingController();
  final TextEditingController? _roomNumberController = TextEditingController();
  final TextEditingController? _phoneNumberController = TextEditingController();
  final TextEditingController? _whatsAppNumberController =
      TextEditingController();
  final TextEditingController? _contactTimesController =
      TextEditingController();
  final TextEditingController? _notesController = TextEditingController();

  get key => _formKey;
  get locationAddressController => _locationAddressController;
  get roomNumberController => _roomNumberController;
  get whatsAppNumberController => _whatsAppNumberController;
  get phoneNumberController => _phoneNumberController;
  get contactTimesController => _contactTimesController;
  get notesController => _notesController;

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

  validation(BuildContext context) async {
    if (_formKey.currentState!.validate()) {}
    SendStorageRequest(sl<StorageRequestRepositoryImpl>());
  }
}
