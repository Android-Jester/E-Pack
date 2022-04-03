import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/header_container.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/sign_up/presentation/pages/components/form_list.dart';
import 'package:e_pack/features/sign_up/presentation/provider/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  static String id = "signUp";
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var bloc = BlocProvider.of<SignUpCubit>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          bloc: bloc,
        builder: (context, state) {
        return Column(
            children: [
              ContainerHeader(),
              SizedBox(height: itemHeight(30.0)),
              FormList(data: bloc),
              SizedBox(height: itemHeight(30.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(20), vertical: itemHeight(20)),
                child: CustomButton(text: "Sign Up", onPressed: () async {}),
              ),
            ],
          );
        },
            listener: (context, state) {}


        ),
      ),
    );
  }
}
