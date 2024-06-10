import 'package:arkatrack/presentation/screens/dashboard/widgets/bottom_navigation_widget.dart';
import 'package:arkatrack/utils/constant.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavigationItems[selectedIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: selectedIndex,
      ),
    );
  }
}
