import 'package:app/controllers/mapController.dart';
import 'package:app/models/User.dart';
import 'package:app/models/group.dart';
import 'package:app/models/sport.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class Match {
  int id, maxMembers;
  String description;
  double latitude, longitude;
  bool public;
  Map<String, dynamic> sport;
  DateTime date;
  Group group;
  List<User> users = [];
  Match(
      {this.id,
      this.description,
      this.latitude,
      this.longitude,
      this.date,
      this.sport,
      this.public = false,
      this.maxMembers,
      this.group,
      this.users}) {
    users = [];
  }
  IconData getIcon() {
    return this.sport['icon'];
  }

  static Match fromJson(Map<String, dynamic> json) {
    Match match = new Match(
        id: json['id'],
        description: json['description'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        sport: Sport.get(json['sport']),
        public: json['public'],
        date: DateTime.parse(json['date']),
        maxMembers: json['max_members'],
        group: json['group'] != null
            ? new Group(
                id: json['group']['id'],
                description: json['group']['description'])
            : null);

    if (json.containsKey('users')) {
      json['users'].forEach((user) => {match.users.add(User.fromJson(user))});
    } else {
      match.users = [];
    }
    return match;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'description': this.description,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'date': DateFormat('yyyy-MM-dd').add_Hm().format(this.date),
      'sport': this.sport['id'],
      'public': this.public,
      'group': this.group.id,
      'max_members': this.maxMembers,
      'users': this.users.map((u) => u.id).toList(),
    };
  }

  Future<double> calcDistance() async {
    var currentPosition = await MapController().fetchCurrentLocation();
    return Geolocator.distanceBetween(
      this.latitude,
      this.longitude,
      currentPosition.latitude,
      currentPosition.longitude,
    );
  }
}
