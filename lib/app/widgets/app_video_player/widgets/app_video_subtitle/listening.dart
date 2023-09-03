import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';

class Listening extends GetView<ListeningController> {
  final ListeningArg arg;
  const Listening(this.arg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningController(arg));
    return Container();
  }
}
