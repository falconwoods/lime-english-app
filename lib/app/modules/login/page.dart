import 'package:get_storage/get_storage.dart';
import 'package:lime_english/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/core/utils/form_validator.dart';

class LoginPage extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtl = TextEditingController();
  final TextEditingController pwdCtl = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                    controller: emailCtl,
                    decoration: const InputDecoration(hintText: 'Email', border: UnderlineInputBorder()),
                    validator: FormValidator.email),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: pwdCtl,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: UnderlineInputBorder(),
                  ),
                  validator: FormValidator.password,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          )),
    );
  }
}
