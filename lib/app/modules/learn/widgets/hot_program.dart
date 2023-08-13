import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lime_english/core/utils/extensions/color_extensions.dart';
import 'package:lime_english/core/utils/extensions/integer_extensions.dart';

class _HotProgramData {
  late final String name;
  late final String icon;
  late final int id;

  _HotProgramData(dynamic arg) {
    name = arg['name'];
    icon = arg['icon'];
    id = arg['id'];
  }

  factory _HotProgramData.from(dynamic arg) {
    return _HotProgramData(arg);
  }
}

class HotProgram extends StatelessWidget {
  late final _HotProgramData _data;

  HotProgram(dynamic data, {super.key}) {
    _data = _HotProgramData.from(data);
  }

  getIcon() => Container(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: Image.network(_data.icon).image,
          fit: BoxFit.cover,
        ),
      ));

  getTitle(context) {
    return Container(
      // width: 200,
      // color: Colors.red,
      child: Text(_data.name,
          style: TextStyle(
              fontSize: 10,
              color: Theme.of(context).textTheme.bodySmall?.color?.lighten(0)),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 220,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIcon(),
          const SizedBox(height: 5),
          getTitle(context),
        ],
      ),
    );
  }
}
