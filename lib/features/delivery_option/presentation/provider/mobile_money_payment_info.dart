import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/finalize.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/box_size_data.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/collection_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/time_info_notifier.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'delivery_recepient_info.dart';

class MomoInformationProvider extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum =
      MaskedTextController(mask: "(000)-000-0000");

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  builder(BuildContext con, PageController controller, int currentPage) {
    // Gets the dependency of each area
    var boxSizes = Provider.of<BoxSizeData>(con, listen: false);
    var timeInfo = Provider.of<TimeInfo>(con, listen: false);
    var relocate = Provider.of<RelocationDetailsInfo>(con, listen: false);
    var collection = Provider.of<CollectionInfo>(con, listen: false);
    var finalInfo = Provider.of<DeliveryRecepientInfo>(con, listen: false);

    // Calculate the Cost
    double _cost = (boxSizes.largeBoxSizeText * 5) +
        (boxSizes.mediumBoxSizeText * 2) +
        (boxSizes.smallBoxSizeText * 1.5);

    // Sets the value of the parameter
    Params params = Params(
      timeCollect: timeInfo.dateTimeVal,
      largeBoxSizeCount: boxSizes.largeBoxSizeText,
      mediumBoxSizeCount: boxSizes.mediumBoxSizeText,
      smallBoxSizeCount: boxSizes.smallBoxSizeText,
      relocateInfo: relocate.relocationValue,
      residenceName: collection.residenceName,
      roomNumber: collection.roomNumber,
      phoneNumber: collection.mobileNumber,
      addressType: collection.addressType,
      accessNote: collection.accessNote,
      destinationAddress: finalInfo.destinationAddress,
      destinationRoomNumber: finalInfo.roomNumber,
      contactName: finalInfo.contactName,
      contactPhoneNum: finalInfo.contactNumber,
      momoPhoneNum: _momoNum.text,
      momoFullName: _momoUser.text,
      cost: _cost,
      collectRoomType: collection.roomNumber,
    );

    // Initialize the Usecase
    var usecase = SendDeliveryRequest(
        repo: DeliveryRequestRepositoryImpl(
            serverHost: DeliveryDataRecieverImpl()));

    //shows a dialog of whether the operation was successful or a failure
    showDialog(
      builder: (context) => FutureBuilder(
          future: usecase.call(params),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Finalize(
                dateTimeVal:
                    Provider.of<TimeInfo>(con, listen: false).dateTimeVal!,
              );
            } else if (snapshot.hasError) {
              return ErrorDialog(retry: () {
                Navigator.pop(context);
                builder(con, controller, currentPage);
              }, dispose: () {
                Navigator.pop(context);
              });
            } else {
              return const Dialog(
                child: CircularProgressIndicator(),
              );
            }
          }),
      context: con,
    );
  }

  get key => _formKey;

  // Validates the TextFields
  validation(
      {required BuildContext con,
      required PageController controller,
      required int currentPage}) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: con,
          builder: (context) {
            Config.init(context);
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(itemWidth(30.0))),
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
                              Navigator.pop(context);
                              builder(con, controller, currentPage);
                            },
                          ),
                          SizedBox(width: itemWidth(36)),
                          CustomButton(
                            width: itemWidth(120),
                            text: "No",
                            onPressed: () => controller
                                .animateToPage(0,
                                    duration: Duration(milliseconds: 1),
                                    curve: Curves.bounceIn)
                                .then((value) => Navigator.pop(context)),
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

  // Sets conditions for validation to be true
  validate(String val, {bool isNumber = false}) {
    if (val == " ") {
      return "There is no username or value";
    } else {
      return (isNumber == true && val.length < 10)
          ? "The number is incomplete"
          : null;
    }
  }
}
