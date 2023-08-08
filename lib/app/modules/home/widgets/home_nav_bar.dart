import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeNavBar extends StatelessWidget {
  final RxInt selectedIndex;
  final void Function(int index) onItemTap;

  const HomeNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: [
            _buildNavItem(context, FontAwesomeIcons.bookAtlas, 'Learn', 0),
            _buildNavItem(context, FontAwesomeIcons.book, 'Review', 1),
            _buildNavItem(context, Icons.quiz_outlined, 'Quiz', 2),
            _buildNavItem(context, FontAwesomeIcons.user, 'My', 3),
          ],
        )));
  }

  Widget _buildNavItem(BuildContext context, icon, String label, int index) {
    final Color mainColor = Theme.of(context).colorScheme.primary;

    return Expanded(
      child: InkWell(
        onTap: () {
          onItemTap(index);
        },
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color:
                    selectedIndex.value == index ? mainColor : Colors.black54),
            Text(
              label,
              style: TextStyle(
                  color: selectedIndex.value == index
                      ? mainColor
                      : Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
