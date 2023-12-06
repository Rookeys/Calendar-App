import 'dart:convert';

import 'package:calendar_app/models/DayOffRequestType.dart';
import 'package:http/http.dart' as http;

Future<List<DayOffRequestType>> getDayOffRequest() async {
  final url =
      Uri.parse('https://dev-mymg3kpb4c1eea7.api.raw-labs.com/your/endpoint/2');
  final response = await http.get(url);
  var dayOffList = <DayOffRequestType>[];

  if (response.statusCode == 200) {
    var parsed = json.decode((response.body)) as List<dynamic>;
    for (var item in parsed) {
      dayOffList.add(DayOffRequestType.fromJson(item));
    }
    return dayOffList;
  } else {
    throw Exception('Failed to load day off request list');
  }
}
