import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_arg.dart';
import 'package:lime_english/app/modules/episode/widgets/listening/listening_controller.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text_controller.dart';

class ListeningText extends GetView<ListeningTextController> {
  final ListeningTextArg? arg;
  const ListeningText(this.arg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningTextController());
    return Container();
  }
}
