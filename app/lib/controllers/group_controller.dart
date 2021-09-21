import 'package:app/api/routes.dart';
import 'package:app/api/services.dart';
import 'package:app/models/group.dart';

class GroupController {
  Group group;
  GroupController({this.group});
  static Future<Group> fetchDetails(int id) async {
    return Group.fromJson(await Services.get('${Routes.GROUP}$id/'));
  }

  static fetchGroups({Map<String, dynamic> filters}) async {
    try {
      return await Services.get(Routes.GROUP, filters);
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, dynamic>> create() async {
    Map<String, dynamic> response =
        await Services.post(Routes.GROUP, {'name': group.name});
    return response.containsKey('errors') ? response['errors'] : null;
  }
}
