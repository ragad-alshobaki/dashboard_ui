import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_dashboard_ui/controllers/menu_app_controller.dart';
import 'package:responsive_dashboard_ui/responsive.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
  // final menuController = context.read<MenuController>();
  // menuController.toggleMenu();
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
            const Expanded(
              child: SideMenu()
            ),
            Expanded(
              flex: 5,
              child: DashboardScreen()
              // child: Column(
              //   children: [
              //     if(!Responsive.isDesktop(context))
              //       IconButton(
              //         icon: const Icon(Icons.menu),
              //         onPressed: (){
              //         context.read<MenuAppController>().controlMenu();}
              //       ),
              //     const Expanded(child: DashboardScreen()),
              //   ],
              // )
            )
          ],
      )),
    );
  }
}

