import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollectSwitch extends StatefulWidget {
  final bool isCollected;
  final void Function(bool)? onChanged;

  const CollectSwitch({super.key, this.isCollected = false, this.onChanged});

  @override
  _CollectSwitchState createState() => _CollectSwitchState();
}

class _CollectSwitchState extends State<CollectSwitch> {
  late bool isCollected;

  @override
  void initState() {
    super.initState();
    isCollected = widget.isCollected;
  }

  void toggleCollect() {
    setState(() {
      isCollected = !isCollected;
      widget.onChanged?.call(isCollected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCollect,
      child: Icon(
        isCollected ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
        color: isCollected ? Colors.green.shade300 : Colors.grey,
        size: 10.0,
      ),
    );
  }
}
