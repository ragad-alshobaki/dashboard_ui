class RecentFile {
  final String? icon, title, date, size;

  RecentFile({this.icon, this.title, this.date, this.size});

  factory RecentFile.fromJson(Map<String, dynamic> json) {
    return RecentFile(
      icon: json['icon'],
      title: json['title'],
      date: json['date'],
      size: json['size'],
    );
  }

  factory RecentFile.fromMap(Map<String, dynamic> map) {
    return RecentFile(
      icon: map['icon'],
      title: map['title'],
      date: map['date'],
      size: map['size'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'title': title,
      'date': date,
      'size': size,
    };
  }

}