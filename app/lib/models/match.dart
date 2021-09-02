import 'package:app/models/User.dart';
import 'package:flutter/cupertino.dart';

class Match {
  int id;
  String location, latitude, longitude;
  bool public;
  Map<String, dynamic> sport;
  DateTime date;
  List<User> users;
  Match(
      {this.id,
      this.location,
      this.latitude,
      this.longitude,
      this.date,
      this.public = false,
      this.users});
  Image getIcon() {
    return Image.asset('assets/images/soccer.png');
  }

  static Match fromJson(Map<String, dynamic> json) {
    Match match = new Match(
        id: json['id'],
        location: json['location'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        date: DateTime.parse(json['date']));

    if (json.containsKey('users')) {
      json['users'].forEach((Map<String, dynamic> user) =>
          {match.users.add(User.fromJson(user))});
    }
    return match;
  }
}
