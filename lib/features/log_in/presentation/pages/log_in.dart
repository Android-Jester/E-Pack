import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/header_container.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/log_in/presentation/provider/login_cubit.dart';
import 'package:e_pack/features/log_in/presentation/provider/login_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';

import 'components/form_list.dart';

class LogIn extends StatelessWidget {
  static String id = "Login";
  LogIn({Key? key}) : super(key: key);

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
    var bloc = BlocProvider.of<LoginCubit>(context, listen: false);
    Config.init(context);
    return SingleChildScrollView(
      child: BlocConsumer<LoginCubit, LoginState>(
          bloc: bloc,
          builder: (context, state) {
        return Column(
          children: [
            const ContainerHeader(isLogin: true,),
            SizedBox(height: itemHeight(25.0)),
            FormList(data: bloc,),
            SizedBox(height: itemHeight(15.0)),
            CustomButton(width: itemWidth(350), text: "Log in", onPressed: () => bloc.validate(context)),
          ],
        );
      }, listener: (context, state) {})

    );
  }
}
