import 'dart:convert';

import 'package:calendar_app/models/communication.dart';
import 'package:http/http.dart' as http;

Future<List<CommunicationType>> getNotification() async {
  final url = Uri.parse(
      'https://dev-mymg3kpb4c1eea7.api.raw-labs.com/your/endpoint/path');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> announcementJson = jsonDecode(response.body);
    return announcementJson
        .map((json) => CommunicationType.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load notification');
  }
}
