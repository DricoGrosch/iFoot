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
      List teams = await Services.get(Routes.TEAM, filters);
      return teams.map((json) => Team.fromJson(json));
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, dynamic>> create(File image) async {
    Map<String, dynamic> response = await Services.post(Routes.TEAM, {
      'name': team.name,
    });
    if (image != null) {
      await Services.fileUpload(Routes.TEAM_IMAGE_UPLOAD, {
        'image': await MultipartFile.fromFile(image.path, filename: image.path),
        'id': response['id'],
      });
    }
    return response.containsKey('errors') ? response['errors'] : null;
  }

  Future<Map<String, dynamic>> update(File image) async {
    Map<String, dynamic> response =
        await Services.put('${Routes.TEAM}${team.id}/', {
      'name': team.name,
    });
    if (image != null) {
      await Services.fileUpload(Routes.TEAM_IMAGE_UPLOAD, {
        'image': await MultipartFile.fromFile(image.path, filename: image.path),
        'id': response['id'],
      });
    }
    return response.containsKey('errors') ? response['errors'] : null;
  }
}
