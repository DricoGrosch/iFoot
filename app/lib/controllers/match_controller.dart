import 'dart:convert';

import 'package:app/models/User.dart';
import 'package:app/settings.dart';
import 'package:http/http.dart' as http;

class MatchController {
  static fetchMatches({bool onlyMines = true}) async {
    var response = await http.get(
        onlyMines
            ? '$SERVER_HOST/api/match'
            : '$SERVER_HOST/api/match?other=true',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token ${User.getAppUser().token}'
        });
    return jsonDecode(response.body);
  }
}
