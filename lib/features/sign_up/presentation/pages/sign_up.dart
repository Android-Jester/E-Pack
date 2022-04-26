import 'package:e_pack_final/core/core_usage/presentation/widgets/dialog_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/screen/HomeScreen.dart';
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

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SignUpCubit>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          bloc: bloc,
          listener: (context, state) {
            print(state);
            setState(() {
              if (state is SignUpError) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (_) {
                      return ErrorDialog(retry: () {}, dispose: () => Navigator.pop(context));
                    });
              } else if (state is SignUpLoading) {
                showDialog(
                    context: context,
                    builder: (_) {
                      return const LoadingDialog();
                    });
              } else if (state is SignUpLoaded) {
                Navigator.popAndPushNamed(context, HomeScreen.id);
              }
            });
          },
          builder: (_, state) {
            if (state is SignUpLoading) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: itemWidth(400)),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Column(
                children: [
                  const Header(),
                  SizedBox(height: itemHeight(30.0)),
                  FormList(data: bloc),
                  SizedBox(height: itemHeight(30.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(20), vertical: itemHeight(20)),
                    child: CustomButton(text: "Sign Up", onPressed: () async => bloc.validate(context)),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
