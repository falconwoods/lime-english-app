import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lime_english/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/login/widgets/password_login.dart';
import 'package:lime_english/core/utils/app_ui.dart';
import 'package:lime_english/core/utils/form_validator.dart';

class LoginPage extends GetView<LoginController> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  LoginPage({super.key});

  void onSubmit(context) {
    // if (!_formKey.currentState!.validate()) return;
    // _formKey.currentState?.save();

    // debugPrint(_formKey.currentState?.value.toString());

    AppUI.snackbar('success', 'hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.lemon,
                          size: 70,
                          color: Colors.green.shade200,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            'Lime English'.tr,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade300),
                          ),
                        )
                      ],
                    )),
                    PasswordLogin(),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: FaIcon(
                            FontAwesomeIcons.weixin,
                            color: Colors.green,
                          ),
                          onTap: () => {},
                        ),
                        GestureDetector(
                          child: FaIcon(FontAwesomeIcons.apple),
                          onTap: () => {},
                        )
                      ],
                    )
                  ],
                ))));
  }
}
