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
  final TextEditingController _momoNum = MaskedTextController(mask: "(000)-000-0000");

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  builder(BuildContext con, PageController controller, int currentPage) {
    double _cost = (Provider.of<BoxSizeData>(con, listen: false).largeBoxSizeText * 5) +
        (Provider.of<BoxSizeData>(con, listen: false).mediumBoxSizeText * 2) +
        (Provider.of<BoxSizeData>(con, listen: false).smallBoxSizeText * 1.5);
    var usecase = SendDeliveryRequest(repo: DeliveryRequestRepositoryImpl(serverHost: DeliveryDataRecieverImpl()));
    print("Started Future");
    showDialog(
      builder: (context) => FutureBuilder(
          future: usecase.call(Params(
              timeCollect: Provider.of<TimeInfo>(con, listen: false).dateTimeVal,
              largeBoxSizeCount: Provider.of<BoxSizeData>(con, listen: false).largeBoxSizeText,
              mediumBoxSizeCount: Provider.of<BoxSizeData>(con, listen: false).mediumBoxSizeText,
              smallBoxSizeCount: Provider.of<BoxSizeData>(con, listen: false).smallBoxSizeText,
              relocateInfo: Provider.of<RelocationDetailsInfo>(con, listen: false).relocationValue,
              residenceName: Provider.of<CollectionInfo>(con, listen: false).residenceName,
              roomNumber: Provider.of<CollectionInfo>(con, listen: false).roomNumber,
              phoneNumber: Provider.of<CollectionInfo>(con, listen: false).mobileNumber,
              addressType: Provider.of<CollectionInfo>(con, listen: false).addressType,
              accessNote: Provider.of<CollectionInfo>(con, listen: false).accessNote,
              destinationAddress: Provider.of<DeliveryRecepientInfo>(con, listen: false).destinationAddress,
              destinationRoomNumber: Provider.of<DeliveryRecepientInfo>(con, listen: false).roomNumber,
              contactName: Provider.of<DeliveryRecepientInfo>(con, listen: false).contactName,
              contactPhoneNum: Provider.of<DeliveryRecepientInfo>(con, listen: false).contactNumber,
              momoPhoneNum: _momoNum.text,
              momoFullName: _momoUser.text,
              cost: _cost,
              collectRoomType: Provider.of<CollectionInfo>(con, listen: false).roomNumber)),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Finalize(
                dateTimeVal: Provider.of<TimeInfo>(con, listen: false).dateTimeVal!,
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

  validation({required BuildContext con, required PageController controller, required int currentPage}) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: con,
          builder: (context) {
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
                              Navigator.pop(context);
                              builder(con, controller, currentPage);
                            },
                          ),
                          SizedBox(width: itemWidth(36)),
                          CustomButton(
                            width: itemWidth(120),
                            text: "No",
                            onPressed: () => controller
                                .animateToPage(0, duration: Duration(milliseconds: 1), curve: Curves.bounceIn)
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

  validate(String val, {bool isNumber = false}) {
    if (val == " ") {
      return "There is no username or value";
    } else {
      return (isNumber == true && val.length < 10) ? "The number is incomplete" : null;
    }
  }
}
