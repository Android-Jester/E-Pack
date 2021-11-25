import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/delivery_option/presentation/components/body.dart';
import 'package:flutter/material.dart';

class DeliveryRecepientInfo extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController? _destinationAddressController = TextEditingController();
  final TextEditingController? _roomNumberController = TextEditingController();
  final TextEditingController? _contactNameController = TextEditingController();
  final TextEditingController? _contactNumberController = TextEditingController();

  get key => _formKey;
  get destinationAddressController => _destinationAddressController;
  get roomNumberController => _roomNumberController;
  get contactNameController => _contactNameController;
  get contactNumberController => _contactNumberController;

  String get destinationAddress => _destinationAddressController!.text;
  String get roomNumber => _roomNumberController!.text;
  String get contactName => _contactNameController!.text;
  String get contactNumber => _contactNumberController!.text;

  String? validator(String val, {bool isNumeric = false, bool isPhoneNumber = false}) {
    if (val.isEmpty) {
      return "Please Fill this space";
    }
    if (isNumeric) {
      if (isPhoneNumber) {
        return (val.length == 11) ? null : "Please type 10 digits";
      } else {
        return "Please type in a number and not a text";
      }
    }
    return null;
  }

  validation(BuildContext context, PageController controller, int currentPage, ScrollController scroll) {
    smoothScrollToTop(scroll);
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            Config.init(context);
            return Dialog(
                child: Container(
                    height: itemHeight(250),
                    child: Column(
                      children: <Widget>[
                        Text("Have you completed everything?"),
                        SizedBox(
                          width: itemWidth(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: CustomButton(
                                    width: itemWidth(70.0),
                                    text: "Yes",
                                    onPressed: () {
                                      controller
                                          .animateToPage(currentPage + 1, duration: Duration(milliseconds: 1), curve: Curves.bounceIn)
                                          .then((value) => Navigator.pop(context));
                                    }),
                              ),
                              Expanded(
                                  child: CustomButton(
                                width: itemWidth(70.0),
                                text: "No",
                                onPressed: () => Navigator.pop(context),
                              ))
                            ],
                          ),
                        ),
                      ],
                    )));
          });
    }
  }
}
