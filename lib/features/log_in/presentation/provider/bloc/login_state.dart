import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';
import 'package:e_pack/features/log_in/domain/usecases/auth_user.dart';
import 'package:e_pack/injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state_forms.dart';

class LoginState extends ChangeNotifier {
  final BuildContext context;

  // Dependency
  late Dependency inject = Provider.of<Dependency>(context);

  // Usecase
  late AuthenticatingUser authUser = AuthenticatingUser(repo: inject.authRepo);

  // Failure Message
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';

  LoginState({
    required this.context,
  });

  Stream<DeliveryState> repoStream({required Either<Failure, String> usecase}) async* {
    yield LoadingState();
    yield usecase.fold(
      (fail) => ErrorState(SERVER_FAILURE_MESSAGE),
      (result) => LoadedState(result),
    );
  }

  Future<Widget> authentication({required String email, required String password}) async {
    return StreamBuilder(
        stream: repoStream(usecase: await authUser(params: Params(email: email, password: password))),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SuccessDialog(
              routeid: HomeScreen.id,
              text: "Logged In Successfully",
            ).builder(context);
          } else {
            if (snapshot.hasError) {
              return ErrorDialog(
                retry: () {
                  authentication(email: email, password: password);
                  Navigator.pop(context);
                },
                dispose: () => Navigator.pop(context),
              ).builder(context);
            } else {
              return const LoadingDialog().builder(context);
            }
          }
        });
  }
}
