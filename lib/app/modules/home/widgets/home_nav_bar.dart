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
    return Obx(() => Container(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  _buildNavItem(
                      context, FontAwesomeIcons.paperPlane, 'Learn', 0),
                  _buildNavItem(
                      context, FontAwesomeIcons.bookOpenReader, 'Review', 1),
                  _buildNavItem(
                      context, FontAwesomeIcons.penToSquare, 'Quiz', 2),
                  _buildNavItem(
                      context, FontAwesomeIcons.userGraduate, 'My', 3),
                ],
              )),
        ));
  }

  Widget _buildNavItem(BuildContext context, icon, String label, int index) {
    const Color mainColor = Color.fromARGB(255, 96, 202, 150);
    // final Color mainColor = Theme.of(context).primaryColor;

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
                    selectedIndex.value == index ? mainColor : Colors.black26),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                  fontSize: 10,
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
