import 'package:e_pack/features/delivery_option/presentation/provider/box_size_data.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/collection_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/delivery_recepient_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/room_type_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'provider/time_info_notifier.dart';

class DeliveryOption extends StatelessWidget {
  static String id = "Page1";

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
      ],
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
