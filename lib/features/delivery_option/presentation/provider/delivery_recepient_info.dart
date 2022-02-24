import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import '../../../storage_option/presentation/components/body.dart';

class DeliveryRecepientInfo extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController? _destinationAddressController = TextEditingController();
  final TextEditingController? _roomNumberController = TextEditingController();
  final TextEditingController? _contactNameController = TextEditingController();
  final TextEditingController? _contactNumberController = MaskedTextController(mask: '(000) 000-0000');

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
        return (val.length == 14) ? null : "Please type 10 digits";
      } else {
        return "Please type in a number and not a text";
      }
    }
    return null;
  }

  String? numValidator(String val) {
    return (val.isNotEmpty && int.parse(val) is num) ? null : "Please Fill this space";
  }

  validation(BuildContext context, PageController controller, int currentPage, ScrollController scroll) {
    smoothScrollToTop(scroll);
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            Config.init(context);
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemWidth(30.0))),
              child: Container(
                height: itemHeight(140),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have you completed everything?"),
                    SizedBox(height: itemHeight(20)),
                    Padding(
                      padding: EdgeInsets.only(left: itemWidth(20)),
                      child: Row(
                        children: [
                          CustomButton(
                            width: itemWidth(120),
                            text: "Yes",
                            onPressed: () {
                              controller
                                  .animateToPage(currentPage + 1, duration: Duration(milliseconds: 1), curve: Curves.bounceIn)
                                  .then((value) => Navigator.pop(context));
                            }, color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          SizedBox(width: itemWidth(36)),
                          CustomButton(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            width: itemWidth(120),
                            text: "No",
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }
  }
}
