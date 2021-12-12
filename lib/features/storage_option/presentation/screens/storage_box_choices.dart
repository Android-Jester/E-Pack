import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/box_selection.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/page_button.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/storage_option/presentation/components/body.dart';
import 'package:e_pack/features/storage_option/presentation/provider/box_size_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StorageBoxChoices extends StatefulWidget {
  final PageController? controller;
  final ScrollController scroll;
  final int? currentPage;
  StorageBoxChoices({
    Key? key,
    required this.scroll,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _BoxChoicesState createState() => _BoxChoicesState();
}

class _BoxChoicesState extends State<StorageBoxChoices> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<StorageBoxSizeData>(
      builder: (context, data, child) => SingleChildScrollView(
        child: ContainerWrapper(
          padding: EdgeInsets.symmetric(vertical: itemWidth(35.0)),
          width: Config.width,
          child: Column(
            children: [
              Text(
                "Select",
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: itemHeight(20)),
                child: Divider(
                  color: Colors.black,
                  thickness: itemHeight(0.5),
                  height: itemHeight(1.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
                child: Text(
                  "Please choose the particular type and number of boxes you may need for your belongings",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const Divider(),
              boxesColumn(data),
              boxSizeInfo(),
              SizedBox(height: itemHeight(20.0)),
              buttonRow(widget.controller!, widget.currentPage!, nextButton: () {
                if (data.largeBoxSizeText != 0 || data.mediumBoxSizeText != 0 || data.smallBoxSizeText != 0) {
                  smoothScrollToTop(widget.scroll);
                  direction(widget.controller!, widget.currentPage!, true);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => WarningDialog(text: "Please select at least one box"),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  Container boxSizeInfo() {
    return Container(
      color: Colors.red.shade200,
      width: Config.width,
      height: Config.height! / 6,
      padding: EdgeInsets.symmetric(horizontal: itemWidth(2.0)),
      child: const Center(
        child: Text(" Size of Large Box: 18”x18”x24” \n Size of Medium Box: 18”x18”x16” \n Size of Small Box: 16”x12”x12” "),
      ),
    );
  }

  Widget boxesColumn(StorageBoxSizeData data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemHeight(30)),
      child: Column(
        children: [
          BoxSelection(
            textEditingController: data.largeBoxController,
            text: "Large Box",
          ),
          BoxSelection(
            textEditingController: data.mediumBoxController,
            text: "Medium Box",
          ),
          BoxSelection(
            textEditingController: data.smallBoxController,
            text: "Small Box",
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
