class DayOffRequestType {
  final String id;
  final String name;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final String description;
  final String profile;

  DayOffRequestType({
    required this.id,
    required this.name,
    required this.startDateTime,
    required this.endDateTime,
    required this.description,
    required this.profile,
  });

  factory DayOffRequestType.fromJson(Map<String, dynamic> json) {
    return DayOffRequestType(
      id: json['id'],
      name: json['name'],
      startDateTime: DateTime.parse(json['startDateTime']),
      endDateTime: DateTime.parse(json['endDateTime']),
      description: json['description'],
      profile: json['profile'],
    );
  }
}
