import 'package:app/api/routes.dart';
import 'package:app/api/services.dart';
import 'package:app/colors/black.dart';
import 'package:app/models/User.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getInitialWidget(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? MaterialApp(
                  title: 'IFoot',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primaryColor: Colors.black, primarySwatch: primaryBlack),
                  home: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  getInitialWidget() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      return LoginPage();
    } else {
      User.getAppUser().token = prefs.getString('token');
      var response =
          await Services.get("${Routes.USER}${prefs.getString('userId')}/");
      User.appUser = User.fromJson(response);
      User.appUser.token = prefs.getString('token');
      return HomePage();
    }
  }
}
