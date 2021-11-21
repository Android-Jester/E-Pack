import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:e_pack/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:e_pack/features/storage_option/presentation/provider/box_size_data.dart';
import 'package:e_pack/features/storage_option/presentation/provider/collection_info.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_period_data.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_recepient_info.dart';
import 'package:e_pack/features/storage_option/presentation/provider/time_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MomoInformationProvider extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = TextEditingController();

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  validation({required BuildContext context}) {
    var usecase = SendStorageRequest(
        StorageRequestRepositoryImpl(serverHost: StorageDataReceiverImpl()));
    double _cost = (Provider.of<BoxSizeData>(context, listen: false)
                .largeBoxSizeText *
            5) +
        (Provider.of<BoxSizeData>(context, listen: false).mediumBoxSizeText *
            2) +
        (Provider.of<BoxSizeData>(context, listen: false).smallBoxSizeText *
            1.5);
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
                            usecase(Params(
                              largeBoxSizeCount: Provider.of<BoxSizeData>(
                                      context,
                                      listen: false)
                                  .largeBoxSizeText,
                              mediumBoxSizeCount: Provider.of<BoxSizeData>(
                                      context,
                                      listen: false)
                                  .mediumBoxSizeText,
                              smallBoxSizeCount: Provider.of<BoxSizeData>(
                                      context,
                                      listen: false)
                                  .smallBoxSizeText,
                              timeCollect:
                                  Provider.of<TimeInfo>(context, listen: false)
                                      .dateTimeVal,
                              semesterPeriod:
                                  Provider.of<TimeInfo>(context, listen: false)
                                      .semesterPeriod,
                              collectRoomType: Provider.of<CollectionInfo>(
                                      context,
                                      listen: false)
                                  .roomNumber
                                  .toString(),
                              storageWeeks: Provider.of<StoragePeriodInfo>(
                                      context,
                                      listen: false)
                                  .weeksStored,
                              residenceName: Provider.of<CollectionInfo>(
                                      context,
                                      listen: false)
                                  .residenceName,
                              roomNumber: Provider.of<StorageRecepientInfo>(
                                      context,
                                      listen: false)
                                  .roomNumber,
                              phoneNumber: Provider.of<CollectionInfo>(context,
                                      listen: false)
                                  .mobileNumber,
                              addressType: Provider.of<CollectionInfo>(context,
                                      listen: false)
                                  .addressType,
                              accessNote: Provider.of<CollectionInfo>(context,
                                      listen: false)
                                  .accessNote,
                              locationName: Provider.of<StorageRecepientInfo>(
                                      context,
                                      listen: false)
                                  .locationAddress,
                              localPhoneNum: Provider.of<StorageRecepientInfo>(
                                      context,
                                      listen: false)
                                  .phoneNumber,
                              whatsPhoneNum: Provider.of<StorageRecepientInfo>(
                                      context,
                                      listen: false)
                                  .whatsAppNumber,
                              contactTimes: Provider.of<StorageRecepientInfo>(
                                      context,
                                      listen: false)
                                  .contactTimes,
                              momoFullName: _momoUser.text,
                              momoPhoneNum: _momoNum.text,
                              cost: _cost,
                            ));
                          }),
                      CustomButton(
                          text: "No", onPressed: () => Navigator.pop(context))
                    ],
                  ),
                ],
              ));
    }
  }

  validate({required bool isNumber}) {
    if (_momoUser.text == null && _momoNum.text == null) {
      return "There is no username or value";
    } else {
      if (isNumber == true && _momoNum.text.length < 10) {
        return "The number is incomplete";
      }
      return null;
    }
  }
}
