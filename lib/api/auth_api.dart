import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthAPI {
  static const String authURL = 'https://parking-reservation.vercel.app/';

  static Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$authURL/$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load API');
    }
  }

  static Future<Map<String, dynamic>> postData(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$authURL/$endpoint'),
      body: json.encode(data), // Convert data to JSON string
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
