import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/app/modules/episode/widgets/listening_text/listening_text_controller.dart';

class ListeningText extends GetView<ListeningTextController> {
  final ScrollController _scrollController = ScrollController();

  ListeningText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ListeningTextController(_scrollController));

    return Expanded(
        child: ListView(
      controller: _scrollController,
      children: controller.blocks,
    ));
  }
}
