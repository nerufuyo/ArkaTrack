// ignore_for_file: must_be_immutable

import 'package:arkatrack/utils/constant.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
  });

  int selectedIndex;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: (index) => setState(() => widget.selectedIndex = index),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        bottomNavigationItems.length,
        (index) => BottomNavigationBarItem(
          icon: Image.asset(
            bottomNavigationItems[index]['icon'],
            width: 28,
          ),
          activeIcon: Image.asset(
            bottomNavigationItems[index]['iconActive'],
            width: 28,
          ),
          label: bottomNavigationItems[index]['label'],
        ),
      ),
    );
  }
}
