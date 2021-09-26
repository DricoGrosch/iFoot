import 'package:app/models/User.dart';
import 'package:flutter/cupertino.dart';

class Team {
  int id;
  String name, image;
  List<User> users;

  Team({this.id, this.name, this.users, this.image}) {
    if (this.users == null) {
      this.users = [];
    }
  }
  static Team fromJson(Map<String, dynamic> json) {
    Team team = new Team(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
    team.users =
        json['users'].map<User>((json) => User.fromJson(json)).toList();
    return team;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  ImageProvider getImage() {
    return this.image != null
        ? NetworkImage(this.image)
        : AssetImage('assets/images/default_user_image.png');
  }
}
