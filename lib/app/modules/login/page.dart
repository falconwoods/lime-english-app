import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lime_english/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(
        title: const Text('Password Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(32),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderTextField(
                    name: 'email',
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: 'Email', border: UnderlineInputBorder()),
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
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: UnderlineInputBorder(),
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
                  child: const Text('Login'),
                ),
              ],
            ),
          )),
    );
  }
}
