import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/sign_up/domain/entities/registering_user.dart';
import 'package:e_pack/features/sign_up/domain/usecases/register_user.dart';
import 'package:e_pack/injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state_forms.dart';

class SignUpState extends ChangeNotifier {
  final BuildContext context;

  // Dependency
  late Dependency inject = Provider.of<Dependency>(context);

  // Usecase
  late RegisteringUser authUser = RegisteringUser(repo: inject.regRepo);

  // Failure Message
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';

  SignUpState({
    required this.context,
  });

  Stream<DeliveryState> repoStream({required Either<Failure, RegisterUser> usecase}) async* {
    yield LoadingState();
    yield usecase.fold(
      (fail) => ErrorState(SERVER_FAILURE_MESSAGE),
      (result) => LoadedState(result),
    );
  }

  Future<Widget> registration({required String email, required String password, required String name}) async {
    return StreamBuilder(
        stream: repoStream(usecase: await authUser(params: Params(email: email, password: password, name: name))),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SuccessDialog(
              routeid: HomeScreen.id,
              text: "Logged In Successfully",
            ).builder(context);
          } else if (snapshot.hasError) {
            return ErrorDialog(
              retry: () {
                registration(email: email, password: password, name: name);
                Navigator.pop(context);
              },
              dispose: () => Navigator.pop(context),
            ).builder(context);
          } else {
            return const LoadingDialog().builder(context);
          }
        });
  }
}
