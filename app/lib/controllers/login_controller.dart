import 'dart:convert';

import 'package:app/models/User.dart';
import 'package:app/settings.dart';
import 'package:http/http.dart' as http;

class LoginController {
  Future<bool> handleLogin(User userData) async {
    if (userData.username == null || userData.password == null) {
      return false;
    }
    var response = await http.post('$SERVER_HOST/api/login',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'username': userData.username, 'password': userData.password}));
    if (response.statusCode != 200) {
      return false;
    }
    User.appUser = User.fromJson(jsonDecode(response.body));
    return true;
  }
}
