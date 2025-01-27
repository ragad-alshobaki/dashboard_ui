import 'package:flutter/material.dart';
import 'package:responsive_dashboard_ui/constants.dart';
import 'package:responsive_dashboard_ui/models/my_files.dart';
import 'package:responsive_dashboard_ui/responsive.dart';
import 'package:responsive_dashboard_ui/screens/dashboard/components/file_info_card.dart';
import 'package:responsive_dashboard_ui/services/data_service.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({super.key});

  @override
  _MyFilesState createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
   List<CloudStorageInfo> myFiles =[];

  @override
  void initState() {
    super.initState();
    // myFiles = fetchMyFiles();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    if(mounted){
      myFiles = await fetchMyFiles();
    setState(() {
      
    });
    }
});
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return 
    myFiles.isEmpty ? Container():
    Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Files",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical:
                          defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text("Add New"),
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            if (Responsive.isMobile(context))
              FilesInfoCardGridView(
                crossAxisCount: _size.width < 650 ? 2 : 4,
                childAspectRatio: _size.width < 650 ? 1.3 : 1,
                files: myFiles,
              )
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    myFiles.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: SizedBox(
                        width: _size.width / 4,
                        child: FileInfoCard(info: myFiles[index]),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
  }
}

class FilesInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final List<CloudStorageInfo> files;

  const FilesInfoCardGridView({
    super.key,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.files,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: files.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: files[index]),
    );
  }
}
