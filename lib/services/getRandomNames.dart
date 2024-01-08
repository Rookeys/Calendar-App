import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> getRandomNames({String name = ''}) async {
  final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/users?nameStartWith=$name'));
  if (response.statusCode == 200) {
    final List<dynamic> users = jsonDecode(response.body);
    return users.map((dynamic user) => user['name'] as String).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
