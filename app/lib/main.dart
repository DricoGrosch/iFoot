import 'package:app/colors/black.dart';
import 'package:app/controllers/user_controller.dart';
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
      UserController().syncData();
      return HomePage();
    }
  }
}
