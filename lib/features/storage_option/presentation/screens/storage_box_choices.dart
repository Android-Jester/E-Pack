import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/function/scroll_movement.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/dialog_states.dart';
import '../../../../core/core_usage/presentation/widgets/options/box_selector.dart';
import '../components/body.dart';
import '../provider/bloc/storage_cubit.dart';

class StorageBoxChoices extends StatefulWidget {
  final PageController controller;
  final ScrollController scroll;
  final int currentPage;
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
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocConsumer<StorageCubit, StorageState>(
      bloc: data,
      builder: (context, state) => SingleChildScrollView(
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
              buttonRow(widget.controller, widget.currentPage, nextButton: () {
                if (int.parse(data.largeBoxController.text) != 0 || int.parse(data.mediumBoxController.text) != 0 || int.parse(data.smallBoxController.text) != 0) {
                  smoothScrollToTop(widget.scroll);
                  direction(widget.controller, widget.currentPage, true);
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
      listener: (context, state) {},
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

  Widget boxesColumn(StorageCubit data) {
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
