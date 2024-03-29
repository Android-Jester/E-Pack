import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'provider/box_size_data.dart';
import 'provider/collection_info.dart';
import 'provider/delivery_recepient_info.dart';
import 'provider/mobile_money_payment_info.dart';
import 'provider/relocation_details_info.dart';
import 'provider/room_type_data.dart';
import 'provider/time_info_notifier.dart';

class DeliveryOption extends StatelessWidget {
  static String id = "Delivery Option";

  const DeliveryOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimeInfo()),
        ChangeNotifierProvider(create: (_) => RoomTypeData()),
        ChangeNotifierProvider(create: (_) => RelocationDetailsInfo()),
        ChangeNotifierProvider(create: (_) => BoxSizeData()),
        ChangeNotifierProvider(create: (_) => CollectionInfo()),
        ChangeNotifierProvider(create: (_) => DeliveryRecepientInfo()),
        ChangeNotifierProvider(create: (_) => MomoInformationProvider()),
      ],
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
