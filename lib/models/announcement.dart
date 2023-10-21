class AnnouncementItem{
  final String id;
  final String title;
  final DateTime createdDate;
  final String content;
  final String category;

  AnnouncementItem({
    required this.id,
    required this.title,
    required this.createdDate,
    required this.content,
    required this.category,
  });

  factory AnnouncementItem.fromJson(Map<String, dynamic> json) {
    return AnnouncementItem(
      id: json['id'],
      title: json['title'],
      createdDate: DateTime.parse(json['created_date']),
      content: json['content'],
      category: json['category'],
    );
  }
}

