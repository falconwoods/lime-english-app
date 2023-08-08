import 'package:flutter/material.dart';

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Offset position,
      required Color color,
      required TextDirection textDirection,
      bool containedInkWell = false,
      rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
      color: color,
      onRemoved: onRemoved,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
    VoidCallback? onRemoved,
  }) : super(
          controller: controller,
          referenceBox: referenceBox,
          color: color,
          onRemoved: onRemoved,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
