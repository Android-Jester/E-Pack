import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../../core/core_usage/presentation/widgets/custom_button.dart';
import '../../../../../core/core_usage/presentation/widgets/dialog_states.dart';
import '../../../domain/usecases/send_delivery_request.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  final SendDeliveryRequest deliveryRequest;
  DeliveryCubit({required this.deliveryRequest}) : super(DeliveryInitial());

  TextEditingController largeBoxController = TextEditingController(text: "0");
  TextEditingController mediumBoxController = TextEditingController(text: "0");
  TextEditingController smallBoxController = TextEditingController(text: "0");
  TextEditingController residenceNameController = TextEditingController();
  TextEditingController destinationRoomNumberController = TextEditingController();
  TextEditingController mobileNumController = MaskedTextController(mask: '(000) 000-0000');
  TextEditingController accessNoteController = TextEditingController();
  TextEditingController destinationAddressController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactNumberController = MaskedTextController(mask: '(000) 000-0000');
  final TextEditingController momoUser = TextEditingController();
  final TextEditingController momoNum = MaskedTextController(mask: "(000)-000-0000");

  bool isGranted = false;
  bool isAgreed = false;
  String addressType = "Hostel";
  int relocationValue = 0;
  int roomType = 0;
  String roomTypedetail= "";
  TextEditingController timeDate = TextEditingController();
  String? dateTimeVal;



  final contactKey = GlobalKey<FormState>();
  final initialKey = GlobalKey<FormState>();
  final boxKey = GlobalKey<FormState>();
  final infoCollectionKey = GlobalKey<FormState>();
  final momoKey = GlobalKey<FormState>();
  final deliveryInfoKey = GlobalKey<FormState>();



  bool isValid() => boxKey.currentState!.validate();

  // Validation Conditions
  String? collectValidator(String val, {bool isNumeric = false, bool isPhoneNumber = false}) {
    if (val.isEmpty) {
      return "Please Fill this space";
    }
    if (isNumeric) {
      if (isPhoneNumber) {
        return (val.length > 14 && val.length < 14) ? "Please type 10 digits" : null;
      }
    } else {
      return null;
    }
    return null;
  }

  String? deliveryInfoValidator(String val, {bool isNumeric = false, bool isPhoneNumber = false}) {
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
  String? textValidator(String val) {
    if(val.isEmpty) {
      return "This is Empty";
    } else {
      return null;
    }
  }
  List<String> addressValue = [
    "Hostel",
    "Homestel",
    "Apartment",
    "Flat",
    "Hall"
  ];
  // If Validation is [True]


  String? deliveryInfoNumValidator(String val) {
    return (val.isNotEmpty && int.parse(val) is num) ? null : "Please Fill this space";
  }


  void allValidation({required ScrollController scroll,
    required PageController controller,
    required int currentPage,
    required GlobalKey<FormState> key,
    required BuildContext context,
  }) {
    if (key.currentState!.validate()) {
      direction(controller, scroll, currentPage, true);
    }   else {showDialog(context: context, builder: (_) => WarningDialog(text: "Please Enter Value"));}

  }
  deliveryInfoValidation({required BuildContext context, required PageController controller, required int currentPage, required ScrollController scroll}) {
    if (deliveryInfoKey.currentState!.validate()) {
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
                            },
                          ),
                          SizedBox(width: itemWidth(36)),
                          CustomButton(
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



  Stream<DeliveryState> sendRequest() async* {
    yield DeliveryLoading();
    emit(DeliveryLoading());
    var result = await deliveryRequest(params: Params(
      timeCollect: timeDate.text,
      smallBoxSizeCount: int.parse(smallBoxController.text),
      mediumBoxSizeCount: int.parse(mediumBoxController.text),
      largeBoxSizeCount: int.parse(largeBoxController.text),
      roomNumber: roomNumberController.text,
      residenceName: residenceNameController.text,
      relocateInfo: relocationValue,
      phoneNumber: mobileNumController.text,
      destinationAddress: destinationAddressController.text,
      destinationRoomNumber: destinationRoomNumberController.text,
      accessNote: accessNoteController.text,
      addressType: addressType,
      collectRoomType: roomTypedetail,
      contactName: contactNameController.text,
      contactPhoneNum: contactNumberController.text,
      momoPhoneNum: momoUser.text,
      momoFullName: momoNum.text,
      cost: 1500.0,
    ));
    yield* result.fold(
            (l) async* {
              emit(DeliveryLoading());
              emit(DeliveryError(errorMessage: l.toString()));
              yield DeliveryError(errorMessage: l.toString());
            },
          (r) async* {
              yield DeliveryLoading();
              yield DeliveryLoaded(successString: r.deliveryKey);
          }
    );

  }
}