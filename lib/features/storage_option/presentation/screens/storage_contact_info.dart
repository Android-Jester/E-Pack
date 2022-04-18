import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/custom_button.dart';
import '../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../provider/bloc/storage_cubit.dart';

class StorageContactInfo extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;
  final ScrollController scroll;

  StorageContactInfo({
    Key? key,
    required this.controller,
    required this.currentPage,
    required this.scroll,
  }) : super(key: key);

  @override
  State<StorageContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<StorageContactInfo> {
  late FocusNode node;

  @override
  void initState() {
    super.initState();
    node = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocConsumer<StorageCubit, StorageState>(
      builder: (context, state) => SingleChildScrollView(
        child: ContainerWrapper(
          height: Config.height! / 1.3,
          width: Config.width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: itemHeight(12.0)),
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  TextWithLabel(
                    text: "Current Location",
                    textCon: data.locationAddressController,
                    validate: (val) => data.textValidator(val!),
                  ),
                  TextWithLabel(
                      validate: (val) => data.phoneNumberValidator(val!),
                      text: "Local Phone Number",
                      textCon: data.phoneNumberController,
                      type: TextInputType.phone),
                  TextWithLabel(
                      validate: (val) => data.phoneNumberValidator(val!),
                      text: "WhatsApp Number",
                      textCon: data.whatsAppNumberController,
                      type: TextInputType.phone),
                  TextWithLabel(
                      text: "Contact Times per week",
                      textCon: data.contactTimesController,
                      validate: (val) => data.numberValidator(val!),
                      type: TextInputType.number),
                  TextWithLabel(text: "Notes", textCon: data.notesController, validate: (val) => data.textValidator(val!), type: TextInputType.multiline),
                  Spacer(),
                  CustomButton(
                    onPressed: () async {
                      data.validation(widget.scroll, widget.controller!, widget.currentPage!);
                    },
                    text: 'Book Now',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
