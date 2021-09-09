import 'dart:convert';
import 'package:app/models/User.dart';
import 'package:app/settings.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future post(String route, Map<String, dynamic> body) async {
    var response = await http.post(Uri.parse('$SERVER_HOST/api/$route'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token ${User.getAppUser().token}'
        },
        body: jsonEncode(body));
    return jsonDecode(response.body);
  }

  static Future get(String route, Map<String, dynamic> params) async {
    String query = Uri(queryParameters: params).query;
    String url = '$SERVER_HOST/api/$route?$query';
    print(url);
    var response =
        await http.get(Uri.parse('$SERVER_HOST/api/$route?$query'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'token ${User.getAppUser().token}'
    });
    return jsonDecode(response.body);
  }

  static Future put() async {
    return null;
  }

  static Future delete() async {
    return null;
  }
}
