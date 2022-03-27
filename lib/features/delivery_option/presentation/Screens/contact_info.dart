import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ContactInfo extends StatefulWidget {
  final PageController? controller;
  final int currentPage;
  final ScrollController scroll;

  ContactInfo({
    required this.scroll,
    required this.controller,
    required this.currentPage,
  });

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> with AutomaticKeepAliveClientMixin {
  FocusNode node = FocusNode();

  @override
  void dispose() {}

  @override
  void initState() {
    super.initState();
    node = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    var currentPage = widget.currentPage;
    var scroll = widget.scroll;
    var bloc = BlocProvider.of<DeliveryCubit>(context);
    var choice = bloc.relocationValue;
    Config.init(context);
    return SingleChildScrollView(
        child: ContainerWrapper(
          height: Config.height,
          width: Config.width,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: Config.width,
                  height: Config.height! / 2,
                  child: Form(
                    key: bloc.deliveryInfoKey,
                    child: Column(
                      children: [
                        (choice == 4)
                            ? SizedBox(
                                height: itemHeight(0.1),
                              )
                            : TextWithLabel(
                                text: "Destination Address",
                                validate: (val) => bloc.deliveryInfoNumValidator(val!),
                                textCon: bloc.destinationAddressController,
                                type: TextInputType.streetAddress,
                              ),
                        (choice == 1 || choice == 2)
                            ? SizedBox(
                                height: itemHeight(0.1),
                              )
                            : TextWithLabel(
                                validate: (val) => bloc.deliveryInfoValidator(val!),
                                text: "Room Number",
                                textCon: bloc.roomNumberController,
                                type: TextInputType.number),
                        TextWithLabel(
                            validate: (val) => bloc.deliveryInfoValidator(val!),
                            text: "Contact Name",
                            textCon: bloc.contactNameController,
                            type: TextInputType.name),
                        TextWithLabel(
                            validate: (val) => bloc.deliveryInfoValidator(val!, isNumeric: true, isPhoneNumber: true),
                            text: "Contact Phone Number",
                            textCon: bloc.contactNumberController,
                            type: TextInputType.phone),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
                child: CustomButton(
                    width: Config.width!,
                    text: "Book Now",
                    onPressed: () => bloc.deliveryInfoValidation(context: context, controller: controller!, currentPage: currentPage, scroll: scroll),
                    ),
              ),
            ],
          ),
        ),
      );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
