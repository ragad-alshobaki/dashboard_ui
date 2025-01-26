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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
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
                  // color: info.color!.withOpacity(0.1),     ***Deprecated
                  color: info.color?.withAlpha((0.1 * 255).toInt()),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  // info.svgSrc ?? '',   **NullSafety
                  info.svgSrc!,
                  // color: info.color,   ***color-Deprecated: NullSafety issue
                  colorFilter: ColorFilter.mode(
                      info.color ?? Colors.black, BlendMode.srcIn),
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          Text(
            //info.title ?? '',   **NullSafety
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressLine(
            info: info,
            color: info.color,
            percentage: info.percentage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfFiles} Files",
                style: Theme.of(context)
                    .textTheme
                    // .caption   ***deprecated
                    .bodySmall!
                    .copyWith(color: Colors.white70),
              ),
              Text(
                info.totalStorage!,
                style: Theme.of(context)
                    .textTheme
                    // .caption   ***deprecated
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  final CloudStorageInfo info;
  final Color? color;
  final int? percentage;
  const ProgressLine({
    super.key,
     this.color = primaryColor, required this.percentage, required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            //color: color?.withAlpha((0.1 * 255).toInt()),   **Solution2 instead declare info in ProgressLine
            color: info.color?.withAlpha((0.1 * 255).toInt()),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}