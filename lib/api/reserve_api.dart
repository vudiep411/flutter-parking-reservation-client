import 'dart:convert';
import 'package:http/http.dart' as http;

class ReserveAPI {
  static const String reserveURL =
      'https://parking-reservation-1xfb.vercel.app';

  static Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$reserveURL/$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load API');
    }
  }
}
