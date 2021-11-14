import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/injector.dart';
import 'package:flutter/material.dart';

class DeliveryRecepientInfo extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController? _destinationAddressController =
      TextEditingController();
  final TextEditingController? _roomNumberController = TextEditingController();
  final TextEditingController? _contactNameController = TextEditingController();
  final TextEditingController? _contactNumberController =
      TextEditingController();

  get key => _formKey;
  get destinationAddressController => _destinationAddressController;
  get roomNumberController => _roomNumberController;
  get contactNameController => _contactNameController;
  get contactNumberController => _contactNumberController;

  int? _cost;
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

  validation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      SendDeliveryRequest(
        sl<DeliveryRequestRepositoryImpl>(),
      );
    }
  }
}
