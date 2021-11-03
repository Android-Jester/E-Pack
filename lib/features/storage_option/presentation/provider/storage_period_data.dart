import 'package:e_pack/features/delivery_option/presentation/provider/box_size_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StoragePeriodInfo extends ChangeNotifier {
  final TextEditingController? weeksStoredBoxController =
      TextEditingController(text: "0");

  int get weeksStored => int.parse(weeksStoredBoxController!.text);
  double setCost(BuildContext context) {
    double val = (Provider.of<BoxSizeData>(context).largeBoxSizeText +
        Provider.of<BoxSizeData>(context).mediumBoxSizeText +
        Provider.of<BoxSizeData>(context).smallBoxSizeText +
        double.parse(weeksStoredBoxController!.text) * 5);
    notifyListeners();
    return val;
  }
}
