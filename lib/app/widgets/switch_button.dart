import 'package:flutter/material.dart';

class SwitchButton<T> extends StatefulWidget {
  final List<T> values;
  final List<Widget> widgets;
  final int defaultIndex;
  final bool disabled;
  final void Function(int, dynamic)? onSwitch;

  const SwitchButton(
      {super.key,
      required this.values,
      required this.widgets,
      required this.defaultIndex,
      this.disabled = false,
      this.onSwitch});

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late int curIndex;

  @override
  void initState() {
    super.initState();
    curIndex = widget.defaultIndex.clamp(0, widget.values.length - 1);
  }

  void toggle() {
    if (widget.disabled) return;
    setState(() {
      curIndex++;
      curIndex %= widget.values.length;
      widget.onSwitch?.call(curIndex, widget.values[curIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: GestureDetector(
        onTap: toggle,
        child: widget.widgets[curIndex],
      ),
    );
  }
}
