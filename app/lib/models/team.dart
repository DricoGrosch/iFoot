import 'package:app/models/User.dart';
import 'package:flutter/cupertino.dart';

class Team {
  int id;
  String description, image;
  List<User> users;
  Team({this.id, this.description, this.users, this.image}) {
    if (this.users == null) {
      this.users = [];
    }
  }
  static Team fromJson(Map<String, dynamic> json) {
    Team team = new Team(
      id: json['id'],
      description: json['description'],
      image: json['image'],
    );
    return team;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'description': this.description,
    };
  }

  ImageProvider getImage() {
    return this.image != null
        ? NetworkImage(this.image)
        : AssetImage('assets/images/default_user_image.png');
  }
}
