import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/models/my_files.dart';
import 'package:responsive_dashboard_ui/responsive.dart';

import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  // final Size _size = MediaQuery.of(context).size;      ***error->need to declare in widget?
  const MyFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              // style: Theme.of(context).textTheme.bodyText2,    ***Not working - Showing error
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding)),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        // FilesInfoCardGridView()
        Responsive(
          mobile: FilesInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2:4,
            childAspectRatio: _size.width < 650 ? 1.3:1,
          ),
          tablet: FilesInfoCardGridView(),
          desktop: FilesInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1: 1.4,
          )
          )
      ],
    );
  }
}

class FilesInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  const FilesInfoCardGridView({
    super.key, this.crossAxisCount = 4, this.childAspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: demoMyFiles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisExtent: defaultPadding,
            childAspectRatio: childAspectRatio,
            ),
        itemBuilder: (context, index) => FileInfoCard(
              info: demoMyFiles[index],
            ));
  }
}

