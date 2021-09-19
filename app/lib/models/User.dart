import 'package:app/models/group.dart';

class User {
  int id;
  String email,
      password,
      password2,
      token,
      firstName,
      lastName,
      username,
      profileImage;
  static User appUser;
  List<Group> groups;

  static User getAppUser() {
    if (appUser == null) {
      appUser = new User();
    }
    return appUser;
  }

  User(
      [this.token = '',
      this.id,
      this.email = '',
      this.password = '',
      this.firstName = '',
      this.lastName = '',
      this.username = '',
      this.profileImage]);

  static User fromJson(Map<String, dynamic> json) {
    User user = new User(
        json['token'] ?? '',
        json['id'] ?? '',
        json['email'] ?? '',
        json['password'] ?? '',
        json['first_name'] ?? '',
        json['last_name'] ?? '',
        json['username'] ?? '',
        json['profile_image'] ?? null);
    user.groups = json['groups']
        .map<Group>((jsonGroup) =>
            new Group(id: jsonGroup['id'], name: jsonGroup['name']))
        .toList();
    return user;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'email': this.email,
      'token': this.token,
      'first_name': this.firstName,
      'last_name': this.lastName,
      'username': this.username,
      'profile_image': this.profileImage,
      'password': this.password,
      'password2': this.password2,
    };
  }
}
