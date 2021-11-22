import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'box_size_data.dart';

class StoragePeriodInfo extends ChangeNotifier {
  final TextEditingController? weeksStoredBoxController =
      TextEditingController(text: "0");
  double? _val;

  int get weeksStored => int.parse(weeksStoredBoxController!.text);
  void setCost(BuildContext context) {
    var provider = Provider.of<StorageBoxSizeData>(context, listen: false);
    _val = (double.parse(provider.largeBoxController!.text) +
        double.parse(provider.mediumBoxController!.text) +
        double.parse(provider.smallBoxController!.text) +
        double.parse(weeksStoredBoxController!.text) * 5);
    notifyListeners();
  }

  double? get cost => _val;
}
