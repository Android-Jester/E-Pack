import 'package:e_pack/features/storage_option/presentation/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StorageOption extends StatelessWidget {
  static String id = "StorageOption";

  const StorageOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(),
      );
  }
}
