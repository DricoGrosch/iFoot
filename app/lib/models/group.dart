import 'package:app/models/User.dart';
import 'package:flutter/cupertino.dart';

class Group {
  int id;
  String description, image;
  List<User> users;
  Group({this.id, this.description, this.users, this.image}) {
    if (this.users == null) {
      this.users = [];
    }
  }
  static Group fromJson(Map<String, dynamic> json) {
    Group group = new Group(
      id: json['id'],
      description: json['description'],
      image: json['image'],
    );
    return group;
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
