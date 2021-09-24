import 'dart:io';

import 'package:app/api/routes.dart';
import 'package:app/api/services.dart';
import 'package:app/models/team.dart';
import 'package:dio/dio.dart';

class TeamController {
  Team team;
  TeamController({this.team});
  static Future<Team> fetchDetails(int id) async {
    return Team.fromJson(await Services.get('${Routes.TEAM}$id/'));
  }

  static fetchTeams({Map<String, dynamic> filters}) async {
    try {
      return await Services.get(Routes.TEAM, filters);
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, dynamic>> create(File image) async {
    Map<String, dynamic> response = await Services.multiPartPost(Routes.TEAM, {
      'description': team.description,
      'image': await MultipartFile.fromFile(image.path, filename: image.path)
    });
    return response.containsKey('errors') ? response['errors'] : null;
  }
}
