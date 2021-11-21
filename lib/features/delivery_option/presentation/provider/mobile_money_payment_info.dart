import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/box_size_data.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/collection_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/time_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'delivery_recepient_info.dart';

class MomoInformationProvider extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = TextEditingController();

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  validation({required BuildContext con}) {
    double _cost = (Provider.of<BoxSizeData>(con, listen: false)
                .largeBoxSizeText *
            5) +
        (Provider.of<BoxSizeData>(con, listen: false).mediumBoxSizeText * 2) +
        (Provider.of<BoxSizeData>(con, listen: false).smallBoxSizeText * 1.5);
    var usecase = SendDeliveryRequest(
        repo: DeliveryRequestRepositoryImpl(
            serverHost: DeliveryDataRecieverImpl()));
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: con,
          builder: (BuildContext context) => SimpleDialog(
                title: Text("Have you completed everything?"),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          text: "Yes",
                          onPressed: () async {
                            print("start");
                            await usecase.call(Params(
                                semesterPeriod:
                                    Provider.of<TimeInfo>(con, listen: false)
                                        .semesterPeriod,
                                timeCollect: Provider.of<TimeInfo>(con, listen: false)
                                    .dateTimeVal,
                                largeBoxSizeCount:
                                    Provider.of<BoxSizeData>(con, listen: false)
                                        .largeBoxSizeText,
                                mediumBoxSizeCount:
                                    Provider.of<BoxSizeData>(con, listen: false)
                                        .mediumBoxSizeText,
                                smallBoxSizeCount:
                                    Provider.of<BoxSizeData>(con, listen: false)
                                        .smallBoxSizeText,
                                relocateInfo:
                                    Provider.of<RelocationDetailsInfo>(con, listen: false)
                                        .relocationValue,
                                residenceName:
                                    Provider.of<CollectionInfo>(con, listen: false).residenceName,
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
                                collectRoomType: Provider.of<CollectionInfo>(con, listen: false).roomNumber));
                          }),
                      CustomButton(
                          text: "No", onPressed: () => Navigator.pop(con))
                    ],
                  ),
                ],
              ));
    }
  }

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
