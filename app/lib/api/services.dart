import 'dart:convert';
import 'package:app/settings.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future post(String route, Object body) async {
    var response = await http.post('$SERVER_HOST/api/$route',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));
    return jsonDecode(response.body);
  }

  static Future _get() {
    return null;
  }

  static Future put() {
    return null;
  }

  static Future selete() {
    return null;
  }
}
