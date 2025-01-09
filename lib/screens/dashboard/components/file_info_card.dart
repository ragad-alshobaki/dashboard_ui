import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/models/my_files.dart';

class FileInfoCard extends StatelessWidget {
  final CloudStorageInfo info;
  const FileInfoCard({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: info.color?.withAlpha((0.1 * 255).toInt()),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: SvgPicture.asset(
                  info.svgSrc ?? '',
                  // color: info.color,   ***deprecated
                  // colorFilter: info.color,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white54,
              )
            ],
          ),
          Text(
            // info.title !,     //***NullSafety
            info.title ?? '',     //***NullSafety
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(color: info.color?? primaryColor,
          percantage: info.percentage?? 0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("${info.numOfFiles} Files",
            style: Theme.of(context)
            .textTheme
            // .caption   ***deprecated
            .bodySmall
            ?.copyWith(
              color: Colors.white70)
            ),
            Text("$info.totalStorage",
            style: Theme.of(context)
            .textTheme
            // .caption   ***deprecated
            .bodySmall
            ?.copyWith(
              color: Colors.white)
            ),
          ],)
        ],)
      );
  }
}

class ProgressLine extends StatelessWidget {
  // final CloudStorageInfo info;
  final Color color;
  final int percantage;
  const ProgressLine({
    super.key,
    // required this.info,
     this.color = primaryColor, required this.percantage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   width: double.infinity,
        //   height: 5,
        //   decoration: BoxDecoration(
        //     color: info.color?.withAlpha((0.1 * 255).toInt()),
        //     borderRadius: BorderRadius.all(Radius.circular(10))
        //   ),
        // ),
        LayoutBuilder(builder: (context, constraints) =>Container(
          width: constraints.maxWidth * (percantage / 100),
          height: 5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),)
      ],
    );
  }
}
