import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'box_size_data.dart';

class StoragePeriodInfo extends ChangeNotifier {
  final TextEditingController? weeksStoredBoxController =
      TextEditingController(text: "0");
  double? _val;

  int get weeksStored => int.parse(weeksStoredBoxController!.text);
  void setCost(BuildContext context) {
    _val = (double.parse(Provider.of<BoxSizeData>(context, listen: false)
            .largeBoxController!
            .text) +
        double.parse(Provider.of<BoxSizeData>(context, listen: false)
            .mediumBoxController!
            .text) +
        double.parse(Provider.of<BoxSizeData>(context, listen: false)
            .smallBoxController!
            .text) +
        double.parse(weeksStoredBoxController!.text) * 5);
    print(_val);
    notifyListeners();
  }

  double? get cost => _val;
}
