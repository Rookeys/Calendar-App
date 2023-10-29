class CommunicationType {
  final String id;
  final String title;
  final DateTime createdDate;
  final String? content;
  final String category;
  final String? userName;

  CommunicationType({
    required this.id,
    required this.title,
    required this.createdDate,
    this.content,
    required this.category,
    this.userName,
  });

  factory CommunicationType.fromJson(Map<String, dynamic> json) {
    return CommunicationType(
      id: json['id'],
      title: json['title'],
      createdDate: DateTime.parse(json['created_date']),
      content: json['content'],
      category: json['category'],
      userName: json['userName'],
    );
  }
}
