import 'package:flutter/material.dart';

import '../../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../../provider/sign_up_cubit.dart';


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
                  validate: (val) => widget.data.emailValidator(val),
                  textCon: widget.data.emailcontroller),
              TextWithLabel(
                node: passwordNode,
                text: "Password",
                validate: (val) => widget.data.passwordValidator(val),
                textCon: widget.data.passwordcontroller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
