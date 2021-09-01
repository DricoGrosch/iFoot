import 'package:app/api/routes.dart';
import 'package:app/api/services.dart';

class MatchController {
  static fetchMatches({Map<String, dynamic> filters}) async {
    try {
      var response = await Services.get(Routes.MATCH, filters);
      return response;
    } catch (e) {
      return [];
    }
  }
}
