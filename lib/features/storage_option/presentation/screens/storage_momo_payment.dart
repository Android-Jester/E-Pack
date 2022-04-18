import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/custom_button.dart';
import '../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../provider/bloc/storage_cubit.dart';

class StorageMomoPayment extends StatefulWidget {
  final ScrollController scroll;
  final PageController controller;
  final int currentPage;
  static String id = "MomoUser";

  StorageMomoPayment({required this.scroll, required this.currentPage, required this.controller});

  @override
  State<StorageMomoPayment> createState() => _MomoInformationState();
}

class _MomoInformationState extends State<StorageMomoPayment> {
  late FocusNode node;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    node = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocConsumer<StorageCubit, StorageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ContainerWrapper(
            padding: EdgeInsets.symmetric(vertical: itemHeight(15.0)),
            width: Config.width,
            height: Config.height! / 2.3,
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  TextWithLabel(
                    validate: (val) => data.textValidator(val!),
                    text: "Mobile Money Name",
                    textCon: data.momoUser,
                    type: TextInputType.name,
                  ),
                  TextWithLabel(validate: (val) => data.numberValidator(val!), text: "Mobile Money Number", textCon: data.momoNum, type: TextInputType.phone),
                  SizedBox(height: itemHeight(35.0)),
                  CustomButton(
                    text: "Finalize",
                    onPressed: () => data.validation(widget.scroll, widget.controller, widget.currentPage),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
