class StorageInfo {
  final String svgSrc;
  final String title;
  final int numOfFiles;
  final String amountOfFiles;

  StorageInfo({
    required this.svgSrc,
    required this.title,
    required this.numOfFiles,
    required this.amountOfFiles,
  });

  // Factory method to create StorageInfo from JSON
  factory StorageInfo.fromJson(Map<String, dynamic> json) {
    return StorageInfo(
      svgSrc: json['svgSrc'],
      title: json['title'],
      numOfFiles: json['numOfFiles'],
      amountOfFiles: json['amountOfFiles'],
    );
  }

  // Method to convert StorageInfo object to JSON (optional for saving data)
  Map<String, dynamic> toJson() {
    return {
      'svgSrc': svgSrc,
      'title': title,
      'numOfFiles': numOfFiles,
      'amountOfFiles': amountOfFiles,
    };
  }
}
