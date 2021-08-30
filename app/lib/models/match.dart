import 'package:app/models/User.dart';

class Match {
  int id;
  String location, latitude, longitude, lastName, username;
  DateTime date;
  List<User> users;
  Match(
      [this.id,
      this.location,
      this.latitude,
      this.longitude,
      this.lastName,
      this.username,
      this.users]);

  static Match fromJson(Map<String, dynamic> json) {
    Match match = new Match(json['id'], json['location'], json['latitude'],
        json['longitude'], json['lastName'], json['username'], []);
    json['users'].forEach(
        (Map<String, dynamic> user) => {match.users.add(User.fromJson(user))});
    return match;
  }
}
