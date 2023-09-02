import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/login/controller.dart';
import 'package:lime_english/app/modules/login/widgets/login_option.dart';
import 'package:lime_english/routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
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
                    ),
                    const SizedBox(height: 200),
                    LoginOption(
                        FontAwesomeIcons.key, Colors.blue, 'Password Login'.tr,
                        () {
                      Get.toNamed(Routes.LOGIN_PASSWORD);
                    }),
                    const SizedBox(height: 8),
                    LoginOption(FontAwesomeIcons.mobileScreen, Colors.blue,
                        'Phone Login'.tr, () {}),
                    const SizedBox(height: 8),
                    LoginOption(FontAwesomeIcons.weixin, Colors.green,
                        'Wechat Login'.tr, () {}),
                    const SizedBox(height: 8),
                    LoginOption(FontAwesomeIcons.apple, Colors.black,
                        'Apple Login'.tr, () {})
                  ],
                ))));
  }
}
