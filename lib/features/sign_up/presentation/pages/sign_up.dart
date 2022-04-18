import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/custom_button.dart';
import '../../../../core/core_usage/presentation/widgets/header.dart';
import '../provider/sign_up_cubit.dart';
import 'components/form_list.dart';

class SignUp extends StatelessWidget {
  static String id = "signUp";
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);

    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SignUpCubit>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          bloc: bloc,
        builder: (context, state) {
        return Column(
            children: [
              Header(),
              SizedBox(height: itemHeight(30.0)),
              FormList(data: bloc),
              SizedBox(height: itemHeight(30.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(20), vertical: itemHeight(20)),
                child: CustomButton(text: "Sign Up", onPressed: () async => bloc.validate(context)),
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
