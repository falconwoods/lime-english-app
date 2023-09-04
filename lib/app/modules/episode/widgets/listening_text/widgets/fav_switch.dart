import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lime_english/app/widgets/switch_button.dart';

class FavSwitch extends StatelessWidget {
  final bool defaultValue;
  final void Function(bool)? onChanged;

  const FavSwitch(this.defaultValue, {Key? key, this.onChanged})
      : super(key: key);

  void onVChange(int index, dynamic value) {
    onChanged!(value == 'yes');
  }

  @override
  Widget build(BuildContext context) {
    return SwitchButton(
      values: const ['yes', 'no'],
      widgets: [
        Icon(
          FontAwesomeIcons.solidHeart,
          color: Colors.green.shade300,
          size: 10.0,
        ),
        const Icon(
          FontAwesomeIcons.heart,
          color: Colors.grey,
          size: 10.0,
        )
      ],
      defaultIndex: defaultValue ? 0 : 1,
      onSwitch: onVChange,
    );
  }
}
