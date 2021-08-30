class User {
  int id;
  String email, password, token, firstName, lastName, username;
  static User appUser;
  static User getAppUser() {
    if (appUser == null) {
      appUser = new User();
    }
    return appUser;
  }

  User(
      [this.token,
      this.id,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.username]);

  static User fromJson(Map<String, dynamic> json) {
    User user = new User(
        json['token'],
        json['user']['id'],
        json['user']['email'],
        json['user']['password'],
        json['user']['first_name'],
        json['user']['last_name'],
        json['user']['username']);
    return user;
  }
}
