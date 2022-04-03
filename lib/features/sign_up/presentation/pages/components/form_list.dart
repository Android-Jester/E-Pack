import 'package:e_pack/features/sign_up/presentation/provider/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import '../../../../../core/presentation/config/config.dart';
import '../../../../../core/presentation/widgets/background_wrapper.dart';
import '../../../../../core/presentation/widgets/text_with_label.dart';

class FormList extends StatefulWidget {
  final SignUpCubit data;
  const FormList({Key? key, required this.data}) : super(key: key);

  @override
  State<FormList> createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  late FocusNode userNameNode;

  late FocusNode emailNode;

  late FocusNode passwordNode;

  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameNode = FocusNode();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      padding: EdgeInsets.symmetric(vertical: itemHeight(15)),
      child: Form(
        key: widget.data.key,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              TextWithLabel(
                  node: userNameNode,
                  nextNode: emailNode,
                  text: "Name",
                  type: TextInputType.name,
                  validate: (val) => widget.data.userNameValidator(val),
                  textCon: widget.data.userNamecontroller),
              TextWithLabel(
                  node: emailNode,
                  nextNode: passwordNode,
                  text: "Email",
                  type: TextInputType.emailAddress,
                  validate: (val) => widget.data.emailvalidator(val),
                  textCon: widget.data.emailcontroller),
              TextWithLabel(
                node: passwordNode,
                text: "Password",
                validate: null,
                textCon: widget.data.passwordcontroller,
                textEditing: (val) {
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
