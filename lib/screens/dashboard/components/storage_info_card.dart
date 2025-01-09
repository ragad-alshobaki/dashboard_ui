import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_ui/constants.dart';

class StorageInfoCard extends StatelessWidget {
  final String title, svgSrc, amountOfFiles;
  final int numOfFiles;
  const StorageInfoCard({
    super.key, required this.title, required this.svgSrc, required this.numOfFiles, required this.amountOfFiles
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: primaryColor
                .withAlpha((0.15 * 255).toInt()),
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(defaultPadding))),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
                svgSrc),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "$numOfFiles Files",
                  style: Theme.of(context)
                      .textTheme
                      // .caption   ***deprecated
                      .bodySmall
                      ?.copyWith(color: Colors.white70),
                )
              ],
            ),
          )),
          Text(amountOfFiles)
        ],
      ),
    );
  }
}
