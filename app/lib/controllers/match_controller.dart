import 'package:app/api/routes.dart';
import 'package:app/api/services.dart';
import 'package:app/models/match.dart';

class MatchController {
  Match match;
  MatchController({this.match});
  static fetchMatches({Map<String, dynamic> filters}) async {
    try {
      var response = await Services.get(Routes.MATCH, filters);
      return response;
    } catch (e) {
      return [];
    }
  }

  Future<bool> create() async {
    try {
      await Services.post(Routes.MATCH, this.match.toJson());
      print('object');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
