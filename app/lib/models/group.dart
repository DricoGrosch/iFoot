import 'package:app/models/User.dart';

class Group {
  int id;
  String name;
  List<User> users;
  Group({this.id, this.name, this.users}) {
    if (this.users == null) {
      this.users = [];
    }
  }
  static Group fromJson(Map<String, dynamic> json) {
    Group group = new Group(
      id: json['id'],
      name: json['name'],
    );
    return group;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }
}
