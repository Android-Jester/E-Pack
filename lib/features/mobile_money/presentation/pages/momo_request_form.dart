import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../manager/momo_request_cubit.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PaymentBody(),
      ),
    );
  }
}

class PaymentBody extends StatefulWidget {
  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {

  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<PaymentRequestCubit>(context);
    return BlocConsumer<PaymentRequestCubit, PaymentRequestState>(
      bloc: bloc,
        builder: (context, state) {
        if(state is PaymentRequestLoaded) {
          return Scaffold(
            body: WebView(
              initialUrl: state.url,
              onPageFinished: (val) {
                bloc.emit(const VerifyTransactionLoaded(false));
              },
            ),
          );
        }
        else if(state is PaymentRequestLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        else if(state is VerifyTransactionLoaded) {
            if(state.status) {
              return Scaffold(
                body: Center(
                  child: Text('STATUS: ${state.status}'),
                ),
              );
            } else {
              return Scaffold(
                body: Center(child: Text("NULL"),),
              );
            }
        }
        else {
          return Scaffold(
            body: Center(child: Text("NULL"),),
          );
        }
      },

      listener: (context, state) {

      }
    );
  }
}
