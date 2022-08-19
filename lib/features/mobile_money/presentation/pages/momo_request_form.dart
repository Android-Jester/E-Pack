import 'dart:io';

import 'package:e_pack_final/core/core_usage/presentation/configurations/sizes.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/Utilities/SizeConfig.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var bloc = BlocProvider.of<PaymentRequestCubit>(context);
    return BlocConsumer<PaymentRequestCubit, PaymentRequestState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is PaymentRequestLoaded) {
           print(state.url);
          return Scaffold(
            body: WebView(
              userAgent: 'Flutter;Webview',
              initialUrl: state.url,
              allowsInlineMediaPlayback: true,
              zoomEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (nav) {
                print("URL_: " + nav.url);
                if (nav.url.contains("https://www.google.com")) {
                  bloc.emit(const VerifyTransactionLoaded(true));
                  return NavigationDecision.prevent;
                } else {
                  return NavigationDecision.navigate;
                }
              },
              //
            ),
          );
          } else if (state is PaymentRequestLoading) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (state is VerifyTransactionLoaded) {
            if (state.status) {
              return Scaffold(
                body: Center(
                  child: Text('STATUS: ${state.status}'),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                    child: CustomButton(
                  onPressed: () {
                    bloc
                        .payAmount(email: "test@test.com", amount: 10000)
                        .listen((event) {
                      bloc.emit(event);
                      print("EVENT: $event");
                    });
                  },
                  text: 'Pay',
                )),
              );
            }
          } else {
            return Scaffold(
              body: Center(
                  child: CustomButton(
                    onPressed: () {
                      bloc
                          .payAmount(email: "test@test.com", amount: 10000)
                          .listen((event) {
                        bloc.emit(event);
                        print("EVENT: $event");
                      });
                    },
                    text: 'Pay',
                  )),
            );
          }
        },
        listener: (context, state) {
          if (state is PaymentRequestInitial) {
            bloc
                .payAmount(email: "test@test.com", amount: 10000)
                .listen((event) {
              bloc.emit(event);
              print("EVENT: $event");
            });
          } else if(state is PaymentRequestLoaded) {

          }
        });
  }
}
