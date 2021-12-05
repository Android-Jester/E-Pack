import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/finalize.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:e_pack/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'box_size_data.dart';
import 'collection_info.dart';
import 'room_type_data.dart';
import 'storage_period_data.dart';
import 'storage_recepient_info.dart';
import 'time_info_notifier.dart';

class StorageMomoPaymentInfo extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = MaskedTextController(mask: "(000)-000-0000");

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  builder(BuildContext con, PageController controller, int currentPage) {
    double _cost = (Provider.of<StorageBoxSizeData>(con, listen: false).largeBoxSizeText * 5) +
        (Provider.of<StorageBoxSizeData>(con, listen: false).mediumBoxSizeText * 2) +
        (Provider.of<StorageBoxSizeData>(con, listen: false).smallBoxSizeText * 1.5);
    var usecase = SendStorageRequest(StorageRequestRepositoryImpl(serverHost: StorageDataReceiverImpl()));
    print("Started Future");
    showDialog(
      builder: (context) => FutureBuilder(
          future: usecase.call(Params(
              semesterPeriod: Provider.of<StorageTimeInfo>(con, listen: false).semesterPeriod,
              timeCollect: Provider.of<StorageTimeInfo>(con, listen: false).dateTimeVal,
              largeBoxSizeCount: Provider.of<StorageBoxSizeData>(con, listen: false).largeBoxSizeText,
              mediumBoxSizeCount: Provider.of<StorageBoxSizeData>(con, listen: false).mediumBoxSizeText,
              smallBoxSizeCount: Provider.of<StorageBoxSizeData>(con, listen: false).smallBoxSizeText,
              storageWeeks: Provider.of<StoragePeriodInfo>(con, listen: false).weeksStored,
              residenceName: Provider.of<StorageCollectionData>(con, listen: false).residenceName,
              roomNumber: Provider.of<StorageCollectionData>(con, listen: false).roomNumber,
              phoneNumber: Provider.of<StorageCollectionData>(con, listen: false).mobileNumber,
              addressType: Provider.of<StorageCollectionData>(con, listen: false).addressType,
              accessNote: Provider.of<StorageCollectionData>(con, listen: false).accessNote,
              locationName: Provider.of<StorageRecepientInfo>(con, listen: false).locationAddress,
              contactTimes: Provider.of<StorageRecepientInfo>(con, listen: false).contactTimes,
              localPhoneNum: Provider.of<StorageRecepientInfo>(con, listen: false).phoneNumber,
              whatsPhoneNum: Provider.of<StorageRecepientInfo>(con, listen: false).whatsAppNumber,
              momoPhoneNum: _momoNum.text,
              momoFullName: _momoUser.text,
              cost: _cost,
              collectRoomType: Provider.of<StorageRoomTypeData>(con, listen: false).roomType.toString())),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Finalize(
                dateTimeVal: Provider.of<StorageTimeInfo>(con, listen: false).dateTimeVal,
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
      return (isNumber == true && val.length < 14 || isNumber == true && val.length > 14) ? "The number is incomplete" : null;
    }
  }
}
