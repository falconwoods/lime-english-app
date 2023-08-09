import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/login/pages/login_controller.dart';
import 'package:lime_english/core/utils/form_validator.dart';
import 'package:lime_english/routes/pages.dart';

class PasswordLoginPage extends GetView<LoginController> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  PasswordLoginPage({super.key});

  void onSubmit(context) {
    // if (!_formKey.currentState!.validate()) return;
    // _formKey.currentState?.save();

    Get.toNamed(Routes.HOME);
    // Get.clearRouteTree();
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
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormBuilderTextField(
                          name: 'email',
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Email / Phone'.tr,
                              border: UnderlineInputBorder()),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'cannot be empty'),
                            FormBuilderValidators.email(
                                errorText: 'please input valid email')
                          ])),
                      const SizedBox(height: 16.0),
                      FormBuilderTextField(
                          name: 'password',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password'.tr,
                            border: const UnderlineInputBorder(),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6,
                                errorText: 'length must >= 6'),
                            FormValidator.notMatch(r'\s',
                                errorText: 'cannot contain whitespace')
                          ])),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () => onSubmit(context),
                        child: Text('Login'.tr),
                      ),
                    ],
                  ),
                ))));
  }
}
