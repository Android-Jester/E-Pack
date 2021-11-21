import 'package:e_pack/features/storage_option/presentation/components/body.dart';
import 'package:e_pack/features/storage_option/presentation/provider/mobile_money_payment_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/box_size_data.dart';
import 'provider/collection_info.dart';
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
        ChangeNotifierProvider(create: (_) => TimeInfo()),
        ChangeNotifierProvider(create: (_) => RoomTypeData()),
        ChangeNotifierProvider(create: (_) => StoragePeriodInfo()),
        ChangeNotifierProvider(create: (_) => BoxSizeData()),
        ChangeNotifierProvider(create: (_) => CollectionInfo()),
        ChangeNotifierProvider(create: (_) => StorageRecepientInfo()),
        ChangeNotifierProvider(create: (_) => MomoInformationProvider()),
      ],
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
