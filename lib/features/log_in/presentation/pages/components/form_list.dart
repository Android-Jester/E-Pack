import 'package:e_pack/features/log_in/presentation/provider/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import '../../../../../core/presentation/config/config.dart';
import '../../../../../core/presentation/widgets/background_wrapper.dart';
import '../../../../../core/presentation/widgets/text_with_label.dart';
import '../../provider/login_info_provider.dart';


class FormList extends StatefulWidget {
  final LoginCubit data;

  const FormList({Key? key, required this.data}) : super(key: key);

  @override
  State<FormList> createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  late FocusNode emailNode;
  late FocusNode passwordNode;

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      padding: EdgeInsets.only(top: itemWidth(15), bottom: itemWidth(30)),
      child: Form(
        key: widget.data.key,
        child: SizedBox(
          child: Column(
            children: [
              TextWithLabel(
                  node: emailNode,
                  nextNode: passwordNode,
                  text: "Email",
                  validate: (val) => widget.data.emailvalidator(val),
                  textCon: widget.data.emailcontroller),
              TextWithLabel(
                node: passwordNode,
                text: "Password",
                validate: null,
                textCon: widget.data.passwordcontroller,
                textEditing: (val) {
                  print("Changes");
                  setState(() {
                    if(val!.isEmpty || val == null) {
                      isVisible = false;
                    } else if(val.length > 1) {
                      isVisible = true;
                    } else {
                      isVisible = true;
                    }
                  });
                },
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: itemWidth(15)),
                  child: FlutterPwValidator(
                    successColor: Colors.green,
                    failureColor: Theme.of(context).colorScheme.error,
                    controller: widget.data.passwordcontroller,
                    minLength: 6,
                    uppercaseCharCount: 2,
                    numericCharCount: 3,
                    specialCharCount: 1,
                    width: 400,
                    height: 150,
                    onSuccess: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
