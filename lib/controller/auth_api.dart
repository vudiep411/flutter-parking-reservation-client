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
}
