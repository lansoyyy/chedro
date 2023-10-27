import 'package:chedro/screens/tabs/dashboard_tab.dart';
import 'package:chedro/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: const DrawerWidget(), body: const DashboardTab());
  }
}
