import 'package:app/api/routes.dart';
import 'package:app/api/services.dart';
import 'package:app/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  User user;
  UserController({this.user});
  Future<bool> handleLogin() async {
    final prefs = await SharedPreferences.getInstance();

    var response = await Services.post(
        Routes.LOGIN, {'username': user.username, 'password': user.password});
    if (response.containsKey('error')) {
      return false;
    }
    User.appUser = User.fromJson(response);
    prefs.setString('token', User.getAppUser().token.toString());
    prefs.setString('userId', User.getAppUser().id.toString());
    return true;
  }

  handleLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void syncData() async {
    final prefs = await SharedPreferences.getInstance();
    User.getAppUser().token = prefs.getString('token');
    var response =
        await Services.get("${Routes.USER}${prefs.getString('userId')}/");
    User.appUser = User.fromJson(response);
    User.appUser.token = prefs.getString('token');
  }
}
