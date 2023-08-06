import 'package:lime_english/app/modules/login/controller.dart';
import 'package:lime_english/app/modules/login/widgets/form.dart';
import 'package:lime_english/app/modules/login/widgets/top_section.dart';
import 'package:lime_english/core/utils/functions/size_config.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController pwdCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TopSectionWidget(),
          Expanded(child: Container()),
          Expanded(
              flex: 3,
              child: LoginFormwidget(
                formkey: _formKey,
              )),
        ],
      ),
    )));
  }
}
