import 'package:app/api/routes.dart';
import 'package:app/api/services.dart';
import 'package:app/models/User.dart';

class LoginController {
  Future<bool> handleLogin(User userData) async {
    if (userData.username == null || userData.password == null) {
      return false;
    }
    var response = await Services.post(Routes.LOGIN,
        {'username': userData.username, 'password': userData.password});
    if (response.containsKey('error')) {
      return false;
    }
    User.appUser = User.fromJson(response);
    return true;
  }
}
