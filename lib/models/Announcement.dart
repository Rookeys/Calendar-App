class AnnouncementType {
  final String id;
  final String title;
  final DateTime createdDate;
  final String? content;
  final String category;
  final String? userName;

  AnnouncementType({
    required this.id,
    required this.title,
    required this.createdDate,
    this.content,
    required this.category,
    this.userName,
  });

  factory AnnouncementType.fromJson(Map<String, dynamic> json) {
    return AnnouncementType(
      id: json['id'],
      title: json['title'],
      createdDate: DateTime.parse(json['created_date']),
      content: json['content'],
      category: json['category'],
      userName: json['userName'],
    );
  }
}

