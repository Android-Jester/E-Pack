import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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

  get locationAddress => _locationAddressController!.text;
  get roomNumber => _roomNumberController!.text;
  get whatsAppNumber => _whatsAppNumberController!.text;
  get phoneNumber => _phoneNumberController!.text;
  get contactTimes => _contactTimesController!.text;
  get notes => _notesController!.text;

  String? validator(String val,
      {bool isNumeric = false, bool isPhoneNumber = false}) {
    if (val.isEmpty) {
      return "Please Fill this space";
    }
    if (isNumeric) {
      if (isPhoneNumber) {
        return (val.length > 10) ? "Please type 10 digits" : null;
      } else {
        return "Please type in a number and not a text";
      }
    }
    return null;
  }

  validation(BuildContext context, PageController controller, int currentPage) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) => SimpleDialog(
                title: Text("Have you completed everything?"),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          text: "Yes",
                          onPressed: () {
                            controller.animateToPage(currentPage + 1,
                                duration: Duration(milliseconds: 1),
                                curve: Curves.bounceIn);
                            Navigator.pop(context);
                          }),
                      CustomButton(
                          text: "No", onPressed: () => Navigator.pop(context))
                    ],
                  ),
                ],
              ));
    }
  }
}
