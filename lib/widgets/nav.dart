import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final List<String> labels;
  final List<IconData> icons;
  final Function(int) onTap;
  final int currentIndex;

  const BottomNavigation({
    super.key,
    required this.labels,
    required this.icons,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List.generate(labels.length, (index) {
        return BottomNavigationBarItem(
          icon: FaIcon(icons[index]),
          label: labels[index],
          backgroundColor: Colors.black
        );
      }),
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
