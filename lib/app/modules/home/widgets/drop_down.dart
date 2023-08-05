import 'package:lime_english/app/data/enum/animals.dart';
import 'package:lime_english/app/modules/home/controller.dart';
import 'package:lime_english/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends GetView<HomeController> {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton<Animals>(
          value: controller.type.value,
          icon: const Icon(
            Icons.arrow_downward,
            color: Colors.white30,
          ),
          elevation: 16,
          style: TextStyle(
              color: controller.darkMode.value ? Colors.black87 : white_smoke),
          underline: Container(
            height: 2,
            color: Colors.white30,
          ),
          onChanged: (Animals? _) => controller.selectAnimal(_!),
          items: <Animals>[Animals.Todos, Animals.Cachorros, Animals.Gatos]
              .map<DropdownMenuItem<Animals>>((Animals value) {
            return DropdownMenuItem<Animals>(
              value: value,
              child: Text(
                value.toString().replaceAll('Animals.', ''),
                style: TextStyle(
                    color: controller.darkMode.value
                        ? white_smoke
                        : Colors.black87),
              ),
            );
          }).toList(),
        ));
  }
}
