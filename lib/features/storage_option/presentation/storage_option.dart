import 'package:e_pack/features/storage_option/presentation/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/box_size_data.dart';
import 'provider/collection_info.dart';
import 'provider/mobile_money_payment_info.dart';
import 'provider/room_type_data.dart';
import 'provider/storage_period_data.dart';
import 'provider/storage_recepient_info.dart';
import 'provider/time_info_notifier.dart';

class StorageOption extends StatelessWidget {
  static String id = "StorageOption";

  const StorageOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StorageTimeInfo()),
        ChangeNotifierProvider(create: (_) => StorageRoomTypeData()),
        ChangeNotifierProvider(create: (_) => StoragePeriodInfo()),
        ChangeNotifierProvider(create: (_) => StorageBoxSizeData()),
        ChangeNotifierProvider(create: (_) => StorageCollectionData()),
        ChangeNotifierProvider(create: (_) => StorageRecepientInfo()),
        ChangeNotifierProvider(create: (_) => StorageMomoPaymentInfo()),
      ],
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
