import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_english/core/app_type.dart';
import 'package:lime_english/core/utils/extensions/color_extensions.dart';

class CardSlider<T> extends StatelessWidget {
  late final String title;
  late final int columnItemNum;
  late final double itemHeight;
  late final List<T> arr;
  late final WidgetBuilderWithData<T> itemBuilder;
  late final ValueSetter<T> onClickItem;
  late final VoidCallback onMore;

  CardSlider(this.title, this.arr, this.columnItemNum, this.itemHeight,
      this.itemBuilder, this.onClickItem, this.onMore,
      {super.key});

  getItems(context) {
    var list = <Widget>[];
    for (int i = 0; i < arr.length; i += columnItemNum) {
      var columnChildren = <Widget>[];
      for (int j = 0; j < columnItemNum; j++) {
        int index = i + j;
        if (index < arr.length) {
          columnChildren.add(InkWell(
              onTap: () => onClickItem(arr[index]),
              child: itemBuilder(context, arr[index])));
        }
      }
      list.add(Column(
        children: columnChildren,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Card(

        // color: Colors.red,
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: onMore,
                        child: Text(
                          'More >'.tr,
                          style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.color
                                  ?.lighten(0.3)),
                        ))
                  ],
                ),
                const SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(
                      height: itemHeight * columnItemNum,
                      enableInfiniteScroll: false,
                      // viewportFraction: 0.7,
                      padEnds: false),
                  items: getItems(context),
                )
              ],
            )));
  }
}
