import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/custom_button.dart';
import '../../../../core/core_usage/presentation/widgets/header.dart';
import '../../../storage_option/presentation/storage_option.dart';
import '../provider/login_cubit.dart';
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
    return WillPopScope(
      onWillPop: () async {
        bloc.emit(LoginInitial());
        return true;
      },
      child: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
            bloc: bloc,
            builder: (context, state) {
          if(state is LoginInitial) {
            return Column(
              children: [
                const Header(isLogin: true,),
                SizedBox(height: itemHeight(25.0)),
                FormList(data: bloc,),
                SizedBox(height: itemHeight(15.0)),
                CustomButton(width: itemWidth(350), text: "Log in", onPressed: () => bloc.validate(context)),
              ],
            );
          } else if(state is LoginError) {
            return Container();
          } else if(state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        }, listener: (context, state) {
              print("STATE: $state");
              if(state is LoginLoaded) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const StorageOption()));
              }
        })

      ),
    );
  }
}
