import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_dashboard_ui/responsive.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  final menuController = context.read<MenuController>();

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  menuController.toggleMenu();
    return Scaffold(
      key: context.read<MenuController>(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
            Expanded(
              child: SideMenu()
            ),
            Expanded(
              flex: 5,
              child: DashboardScreen()
            )
          ],
      )),
    );
  }
}

