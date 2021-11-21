import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/box_selection.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/box_size_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoxChoices extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;
  BoxChoices({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _BoxChoicesState createState() => _BoxChoicesState();
}

class _BoxChoicesState extends State<BoxChoices>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<BoxSizeData>(
      builder: (context, data, child) => SingleChildScrollView(
        child: Container(
          width: Config.width,
          height: Config.height,
          child: Column(
            children: [
              Text(
                "Select",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 15.0),
              Divider(
                color: Colors.black,
                thickness: itemHeight(0.5),
                height: itemHeight(1.5),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
                child: Text(
                  "Please choose the particular type and number of boxes you may need for your belongings",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const Divider(),
              SizedBox(height: itemHeight(40.0)),
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
              SizedBox(height: itemHeight(40.0)),
              Container(
                color: Colors.red.shade200,
                width: Config.width,
                height: Config.height! / 6,
                padding: EdgeInsets.symmetric(horizontal: itemWidth(2.0)),
                child: const Center(
                  child: Text(
                      " Size of Large Box: 18”x18”x24” \n Size of Medium Box: 18”x18”x16” \n Size of Small Box: 16”x12”x12” "),
                ),
              ),
              SizedBox(height: itemHeight(20.0)),
              buttonRow(widget.controller!, widget.currentPage!,
                  nextButton: () {
                if (data.largeBoxSizeText != 0 ||
                    data.mediumBoxSizeText != 0 ||
                    data.smallBoxSizeText != 0) {
                  direction(widget.controller!, widget.currentPage!, true);
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
