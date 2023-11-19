import 'dart:convert';

import 'package:calendar_app/models/communication.dart';
import 'package:http/http.dart' as http;

Future<List<CommunicationType>> getAnnouncement() async {
  final url = Uri.parse('https://dev-mymg3kpb4c1eea7.api.raw-labs.com/3');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> announcementJson = jsonDecode(response.body);
    return announcementJson
        .map((json) => CommunicationType.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load announcement');
  }
}
