// //Need to check below due not working
// //my_files.dart
// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_dashboard_ui/constants.dart';
// import 'package:responsive_dashboard_ui/models/my_files.dart';
// import 'package:responsive_dashboard_ui/responsive.dart';

// import 'file_info_card.dart';

// class MyFiles extends StatelessWidget {
//   // final Size _size = MediaQuery.of(context).size;      *** ?error->have to declare in widget
//   const MyFiles({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final Size _size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "My Files",
//               style: Theme.of(context).textTheme.bodyMedium,    //*** .subtitle1/.bodyText2 Not working - Showing error
//             ),
//             ElevatedButton.icon(
//               style: TextButton.styleFrom(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: defaultPadding * 1.5,
//                       vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1))),
//               onPressed: () {},
//               icon: Icon(Icons.add),
//               label: Text("Add New"),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: defaultPadding),
//         GridView.builder(
//               shrinkWrap: true,
//               itemCount: demoMyFiles.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: defaultPadding,
//                 // childAspectRatio: _size.width < 1400 ? 1.1:1.4,
//                 ),
//                 itemBuilder: (context, index) =>
//                   FileInfoCard(info: demoMyFiles[index],),
//           ),


















//         // if(Responsive.isMobile(context))
//         //   SizedBox(
//         //     height: _size.height * 0.5,
//         //     child: GridView.builder(
//         //       shrinkWrap: true,
//         //       itemCount: demoMyFiles.length,
//         //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //         crossAxisCount: 4,
//         //         crossAxisSpacing: defaultPadding,
//         //         childAspectRatio: _size.width < 1400 ? 1.1:1.4,
//         //         ),
//         //         itemBuilder: (context, index) =>
//         //           FileInfoCard(info: demoMyFiles[index],),
//         //       ),
//         //   ),
//         // if(!Responsive.isMobile(context))
//         //   Expanded(
//         //     child: SingleChildScrollView(
//         //       scrollDirection: Axis.horizontal,
//         //       child: ConstrainedBox(
//         //         constraints: BoxConstraints(
//         //             maxWidth: _size.width,
//         //           ),
//         //         child: FilesInfoCardGridView(
//         //             crossAxisCount: _size.width < 1400 ? 4 : 6,
//         //             childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
//         //           ),
//         //       ),
//         //     ),
//         //   ),
//         // FilesInfoCardGridView(),             ***make it external making issue-disappearing
//         // Responsive(
//         //   mobile: FilesInfoCardGridView(
//         //     crossAxisCount: _size.width < 650 ? 2:4,
//         //     childAspectRatio: _size.width < 650 ? 1.3:1,
//         //   ),
//         //   tablet: FilesInfoCardGridView(),
//         //   desktop: FilesInfoCardGridView(
//         //     childAspectRatio: _size.width < 1400 ? 1.1: 1.4,
//         //   )
//         //   )
//       ],
//     );
//   }
// }

// class FilesInfoCardGridView extends StatelessWidget {
//   final int crossAxisCount;
//   final double childAspectRatio;
//   const FilesInfoCardGridView({
//     super.key, this.crossAxisCount = 4, this.childAspectRatio = 1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: demoMyFiles.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: crossAxisCount,
//             crossAxisSpacing: defaultPadding,
//             mainAxisExtent: defaultPadding,
//             childAspectRatio: childAspectRatio,
//             ),
//         itemBuilder: (context, index) => FileInfoCard(
//               info: demoMyFiles[index],
//             ));
//   }
// }

// //file_info_card.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:responsive_dashboard_ui/constants.dart';
// import 'package:responsive_dashboard_ui/models/my_files.dart';

// class FileInfoCard extends StatelessWidget {
//   final CloudStorageInfo info;
//   const FileInfoCard({
//     super.key,
//     required this.info,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(defaultPadding),
//       decoration: BoxDecoration(
//           color: secondaryColor,
//           borderRadius: const BorderRadius.all(Radius.circular(10))),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(defaultPadding * 0.75),
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                     color: info.color?.withAlpha((0.1 * 255).toInt()),
//                     borderRadius: const BorderRadius.all(Radius.circular(10))),
//                 child: SvgPicture.asset(
//                   info.svgSrc ?? '',
//                   // color: info.color,   ***deprecated
//                   // colorFilter: info.color,
//                 ),
//               ),
//               Icon(
//                 Icons.more_vert,
//                 color: Colors.white54,
//               )
//             ],
//           ),
//           Text(
//             // info.title !,     //***NullSafety
//             info.title ?? '',     //***NullSafety
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           ProgressLine(color: info.color?? primaryColor,
//           percantage: info.percentage?? 0,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//             Text("${info.numOfFiles} Files",
//             style: Theme.of(context)
//             .textTheme
//             // .caption   ***deprecated
//             .bodySmall
//             ?.copyWith(
//               color: Colors.white70)
//             ),
//             Text("$info.totalStorage",      //<< *Caused the overFlowed >>
//             style: Theme.of(context)
//             .textTheme
//             // .caption   ***deprecated
//             .bodySmall
//             ?.copyWith(
//               color: Colors.white)
//             ),
//           ],)
//         ],)
//       );
//   }
// }

// class ProgressLine extends StatelessWidget {
//   // final CloudStorageInfo info;
//   final Color color;
//   final int percantage;
//   const ProgressLine({
//     super.key,
//     // required this.info,
//      this.color = primaryColor, required this.percantage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Container(
//         //   width: double.infinity,
//         //   height: 5,
//         //   decoration: BoxDecoration(
//         //     color: info.color?.withAlpha((0.1 * 255).toInt()),
//         //     borderRadius: BorderRadius.all(Radius.circular(10))
//         //   ),
//         // ),
//         LayoutBuilder(builder: (context, constraints) =>Container(
//           width: constraints.maxWidth * (percantage / 100),
//           height: 5,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.all(Radius.circular(10))
//           ),
//         ),)
//       ],
//     );
//   }
// }
