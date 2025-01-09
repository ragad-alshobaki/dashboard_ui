import 'package:flutter/material.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/responsive.dart';
// import 'package:responsive_dashboard_ui/models/my_files.dart';

import 'components/header.dart';
import 'components/my_files.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';
// import 'components/storage_info_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        RecentFiles(),
                        if (Responsive.isMobile(context))
                        SizedBox(
                          height: defaultPadding,
                        ),
                        if (Responsive.isMobile(context))
                          StorageDetails(),
                      ],
                    )),
                if (!Responsive.isMobile(context))
                SizedBox(
                  width: defaultPadding,
                ),
                if (!Responsive.isMobile(context))
                  Expanded(  //>850
                      flex: 2,
                      child: StorageDetails()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
