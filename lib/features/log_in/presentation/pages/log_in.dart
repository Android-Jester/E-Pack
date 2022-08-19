import 'package:e_pack_final/core/core_usage/presentation/screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/custom_button.dart';
import '../../../../core/core_usage/presentation/widgets/dialog_states.dart';
import '../../../../core/core_usage/presentation/widgets/header.dart';
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

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BodyState();
}

class BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<LoginCubit>(context);
    Config.init(context);
    return WillPopScope(
      onWillPop: () async {
        bloc.emit(LoginInitial());
        return true;
      },
      child: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
              bloc: bloc,
              builder: (_, state) {
                if (state is LoginLoading) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: itemWidth(400)),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      const Header(
                        isLogin: true,
                      ),
                      SizedBox(height: itemHeight(25.0)),
                      FormList(
                        data: bloc,
                      ),
                      SizedBox(height: itemHeight(15.0)),
                      CustomButton(width: itemWidth(350), text: "Log in", onPressed: () => bloc.validate(context)),
                    ],
                  );
                }
              },
              listener: (context, state) {
                
                setState(() {
                  if (state is LoginError) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return ErrorDialog(retry: () {
                            bloc.clearData(context);
                          }, dispose: () => Navigator.pop(context));
                        });
                  } else if (state is LoginLoaded) {
                    Navigator.popAndPushNamed(context, HomeScreen.id);
                  }
                });
              })),
    );
  }
}
