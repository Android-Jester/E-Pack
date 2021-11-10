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
      // final DeliveryRequestModel deliveryRequestModel = DeliveryRequestModel(
      //   timeCollect:
      //       Provider.of<TimeInfo>(context, listen: false).timeDateData.text,
      //   semesterPeriod:
      //       Provider.of<TimeInfo>(context, listen: false).semesterPeriod,
      //   relocateInfo: Provider.of<RelocationDetailsInfo>(context, listen: false)
      //       .relocationValue,
      //   residenceName: Provider.of<CollectionInfo>(context, listen: false)
      //       .residenceNameController
      //       .text,
      //   collectRoomType: Provider.of<RoomTypeData>(context, listen: false)
      //       .roomType
      //       .toString(),
      //   roomNumber: int.parse(
      //       Provider.of<CollectionInfo>(context, listen: false)
      //           .roomNumController
      //           .text),
      //   phoneNumber: Provider.of<CollectionInfo>(context, listen: false)
      //       .mobileNumController
      //       .text,
      //   addressType: Provider.of<CollectionInfo>(context, listen: false)
      //       .addressTypeController
      //       .text,
      //   accessNote: Provider.of<CollectionInfo>(context, listen: false)
      //       .accessNoteController
      //       .text,
      //   destinationAddress:
      //       Provider.of<DeliveryRecepientInfo>(context, listen: false)
      //           .destinationAddressController
      //           .text,
      //   destinationRoomNumber: int.parse(
      //       Provider.of<DeliveryRecepientInfo>(context, listen: false)
      //           .roomNumberController
      //           .text),
      //   contactName: Provider.of<DeliveryRecepientInfo>(context, listen: false)
      //       .contactNameController
      //       .text,
      //   contactPhoneNum:
      //       Provider.of<DeliveryRecepientInfo>(context, listen: false)
      //           .contactNameController
      //           .text,
      //   largeBoxSizeCount:
      //       Provider.of<BoxSizeData>(context, listen: false).largeBoxSizeText,
      //   mediumBoxSizeCount:
      //       Provider.of<BoxSizeData>(context, listen: false).mediumBoxSizeText,
      //   smallBoxSizeCount:
      //       Provider.of<BoxSizeData>(context, listen: false).smallBoxSizeText,
      //   momoFullName: "momoFullName",
      //   momoPhoneNum: "momoPhoneNum",
      //   cost: 1250.0,
      // );
      // print(deliveryRequestModel);
      // notifyListeners();

      // return SendDeliveryRequest(deliveryRequestModel);
    }
  }
}
